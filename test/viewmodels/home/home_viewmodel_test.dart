import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/main/viewmodels/home/home_viewmodel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_all_meds_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/get_user_by_id_usecase.dart';

class MockGetAllMedsUsecase extends Mock implements GetAllMedsUsecase {}

class MockGetUserByIdUsecase extends Mock implements GetUserByIdUsecase {}

void main() {
  late HomeViewmodel viewModel;
  late MockGetAllMedsUsecase mockGetAllMedsUsecase;
  late MockGetUserByIdUsecase mockGetUserByIdUsecase;

  setUp(() {
    mockGetAllMedsUsecase = MockGetAllMedsUsecase();
    mockGetUserByIdUsecase = MockGetUserByIdUsecase();
    viewModel = HomeViewmodel(mockGetAllMedsUsecase, mockGetUserByIdUsecase);
  });

  test(
    'Deve inicializar com nome do usuário e medicamentos filtrados',
    () async {
      final user = UserEntity(
        id: '1',
        name: 'Tiago',
        email: 't@email.com',
        senha: '123456',
      );
      final medicamentos = [
        MedicacaoEntity(
          id: 1,
          nome: 'Remédio A',
          observacao: '',
          tomando: true,
          diasSemana: [DateTime.now().weekday],
          userId: 1,
          startDate: DateTime.now(),
          endDate: DateTime.now(),
        ),
      ];

      when(() => mockGetUserByIdUsecase.call())
  .thenAnswer((_) => Future.value(user as FutureOr<UserEntity?>?));

      when(
        () => mockGetAllMedsUsecase.call(),
      ).thenAnswer((_) async => medicamentos);

      await viewModel.init();

      expect(viewModel.username.value, 'Tiago');
      expect(viewModel.meds.value.length, 1);
      expect(viewModel.error.value, isNull);
      expect(viewModel.isLoading.value, false);

      verify(() => mockGetUserByIdUsecase.call()).called(1);
      verify(() => mockGetAllMedsUsecase.call()).called(1);
    },
  );

  test('Deve tratar erro ao inicializar', () async {
    when(() => mockGetUserByIdUsecase.call()).thenThrow(Exception('Falha'));

    await viewModel.init();

    expect(viewModel.error.value, isNotNull);
    expect(viewModel.isLoading.value, false);
  });
}
