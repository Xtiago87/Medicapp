import 'package:flutter_test/flutter_test.dart';
import 'package:medicapp/app/modules/main/viewmodels/detalhes_med/detalhes_med_viewmodel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/cadastro_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/deletar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/editar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_med_id_usecase.dart';

class MockGetMedByIdUsecase extends Mock implements GetMedByIdUsecase {}

class MockDeletarMedUsecase extends Mock implements DeletarMedUsecase {}

class MockEditarMedUsecase extends Mock implements EditarMedUsecase {}

void main() {
  late MockGetMedByIdUsecase mockGetMedByIdUsecase;
  late MockDeletarMedUsecase mockDeletarMedUsecase;
  late MockEditarMedUsecase mockEditarMedUsecase;
  late DetalhesMedViewmodel viewmodel;

  setUp(() {
    mockGetMedByIdUsecase = MockGetMedByIdUsecase();
    mockDeletarMedUsecase = MockDeletarMedUsecase();
    mockEditarMedUsecase = MockEditarMedUsecase();

    viewmodel = DetalhesMedViewmodel(
      mockGetMedByIdUsecase,
      mockDeletarMedUsecase,
      mockEditarMedUsecase,
    );
  });

  setUpAll(() {
    registerFallbackValue(
      MedicacaoEntity(
        id: 0,
        nome: '',
        observacao: '',
        diasSemana: [],
        tomando: false,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        userId: 0,
      ),
    );
  });

  group('DetalhesMedViewmodel', () {
    test('getMed retorna uma medicação válida', () async {
      final medicacao = MedicacaoEntity(
        id: 1,
        nome: 'Dipirona',
        observacao: 'Tomar após almoço',
        diasSemana: [1, 3, 5],
        userId: 1,
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 10)),
        tomando: true,
      );

      when(
        () => mockGetMedByIdUsecase.call(1),
      ).thenAnswer((_) async => medicacao);

      final result = await viewmodel.getMed(1);

      expect(result, isNotNull);
      expect(result!.nome, 'Dipirona');
    });

    test('editarMedicacao retorna true após editar com sucesso', () async {
      when(
        () => mockEditarMedUsecase.call(any()),
      ).thenAnswer((_) async => Future.value(true));

      final success = await viewmodel.editarMedicacao(
        id: 1,
        nome: 'Ibuprofeno',
        observacao: '2x ao dia',
        tomando: true,
        diasSemana: [2, 4, 6],
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 5)),
      );

      expect(success, true);
    });

    test('deleteMed retorna true após deletar com sucesso', () async {
      when(() => mockDeletarMedUsecase.call(1)).thenAnswer((_) async => true);

      final result = await viewmodel.deleteMed(1);

      expect(result, true);
    });
  });
}
