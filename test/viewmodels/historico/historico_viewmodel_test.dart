import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_all_meds_usecase.dart';
import 'package:medicapp/app/modules/main/viewmodels/historico/historico_viewmodel.dart';

class MockGetAllMedsUsecase extends Mock implements GetAllMedsUsecase {}

void main() {
  late HistoricoViewmodel viewmodel;
  late MockGetAllMedsUsecase mockGetAllMedsUsecase;

  setUp(() {
    mockGetAllMedsUsecase = MockGetAllMedsUsecase();
    viewmodel = HistoricoViewmodel(mockGetAllMedsUsecase);
  });
  final medsFakes = [
    MedicacaoEntity(
      id: 1,
      nome: 'Dipirona',
      observacao: '',
      diasSemana: [1],
      tomando: true,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 5)),
      userId: 1,
    ),
    MedicacaoEntity(
      id: 2,
      nome: 'Ibuprofeno',
      observacao: '',
      diasSemana: [2],
      tomando: false,
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 5)),
      userId: 1,
    ),
  ];
  test('Deve carregar medicamentos corretamente no init', () async {
    when(() => mockGetAllMedsUsecase.call()).thenAnswer((_) async => medsFakes);

    await viewmodel.init();

    expect(viewmodel.meds.value.length, 2);
    expect(viewmodel.error.value, isNull);
    expect(viewmodel.isLoading.value, false);
  });

  test('Filtro "Tomando" filtra corretamente', () async {
    when(() => mockGetAllMedsUsecase.call()).thenAnswer((_) async => medsFakes);

    await viewmodel.init();
    viewmodel.setFilter('Tomando');

    expect(viewmodel.meds.value.length, 1);
    expect(viewmodel.meds.value.first.nome, 'Dipirona');
  });

  test('Busca por nome funciona', () async {
    when(() => mockGetAllMedsUsecase.call()).thenAnswer((_) async => medsFakes);

    await viewmodel.init();
    viewmodel.setSearchQuery('Ibu');

    expect(viewmodel.meds.value.length, 1);
    expect(viewmodel.meds.value.first.nome, 'Ibuprofeno');
  });
}
