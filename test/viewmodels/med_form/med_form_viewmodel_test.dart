import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/cadastro_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/deletar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/editar_med_usecase.dart';
import 'package:medicapp/app/modules/main/viewmodels/med_form/med_form_viewmodel.dart';

class MockCadastroMedUsecase extends Mock implements CadastroMedUsecase {}

class MockDeletarMedUsecase extends Mock implements DeletarMedUsecase {}

class MockEditarMedUsecase extends Mock implements EditarMedUsecase {}

void main() {
  late MedFormViewmodel viewmodel;
  late MockCadastroMedUsecase mockCadastroMedUsecase;
  late MockDeletarMedUsecase mockDeletarMedUsecase;
  late MockEditarMedUsecase mockEditarMedUsecase;

  setUp(() {
    mockCadastroMedUsecase = MockCadastroMedUsecase();
    mockDeletarMedUsecase = MockDeletarMedUsecase();
    mockEditarMedUsecase = MockEditarMedUsecase();
    viewmodel = MedFormViewmodel(
      mockCadastroMedUsecase,
      mockDeletarMedUsecase,
      mockEditarMedUsecase,
    );

    registerFallbackValue(
      MedicacaoEntity(
        id: null,
        nome: '',
        observacao: '',
        diasSemana: [],
        userId: 0,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        tomando: false,
      ),
    );
  });

  test('Salvar medicamento com sucesso', () async {
    final medEntity = MedicacaoEntity(
        id: null,
        nome: '',
        observacao: '',
        diasSemana: [],
        userId: 0,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        tomando: false,
      );
    
    when(
      () => mockCadastroMedUsecase.call(any<MedicacaoEntity>()),
    ).thenAnswer((_) async => Future.value(medEntity));

    final result = await viewmodel.salvarMedicacao(
      nome: 'Dipirona',
      observacao: 'Tomar 2x ao dia',
      tomando: true,
      diasSemana: [1, 3, 5],
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 5)),
    );

    expect(result, true);
    expect(viewmodel.error.value, isNull);
    expect(viewmodel.isLoading.value, false);

    verify(() => mockCadastroMedUsecase.call(any())).called(1);
  });

  test('Salvar medicamento com erro', () async {
    when(
      () => mockCadastroMedUsecase.call(any()),
    ).thenThrow(Exception('Erro inesperado'));

    final result = await viewmodel.salvarMedicacao(
      nome: 'Ibuprofeno',
      observacao: '',
      tomando: false,
      diasSemana: [2, 4],
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(days: 7)),
    );

    expect(result, false);
    expect(viewmodel.error.value, isNotNull);
    expect(viewmodel.isLoading.value, false);

    verify(() => mockCadastroMedUsecase.call(any())).called(1);
  });
}
