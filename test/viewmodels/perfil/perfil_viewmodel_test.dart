import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/deletar_conta_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/editar_user_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/get_user_by_id_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/logout_user_usecase.dart';
import 'package:medicapp/app/modules/main/viewmodels/perfil/perfil_viewmodel.dart';

class MockDeletarContaUsecase extends Mock implements DeletarContaUsecase {}
class MockGetUserByIdUsecase extends Mock implements GetUserByIdUsecase {}
class MockLogoutUsecase extends Mock implements LogoutUsecase {}
class MockEditarContaUsecase extends Mock implements EditarContaUsecase {}

void main() {
  late PerfilViewmodel viewmodel;
  late MockDeletarContaUsecase mockDeletarContaUsecase;
  late MockGetUserByIdUsecase mockGetUserByIdUsecase;
  late MockLogoutUsecase mockLogoutUsecase;
  late MockEditarContaUsecase mockEditarContaUsecase;

  final user = UserEntity(id: '1', name: 'Tiago', email: 't@email.com', senha: '123456');

  setUp(() {
    mockDeletarContaUsecase = MockDeletarContaUsecase();
    mockGetUserByIdUsecase = MockGetUserByIdUsecase();
    mockLogoutUsecase = MockLogoutUsecase();
    mockEditarContaUsecase = MockEditarContaUsecase();

    viewmodel = PerfilViewmodel(
      mockDeletarContaUsecase,
      mockGetUserByIdUsecase,
      mockLogoutUsecase,
      mockEditarContaUsecase,
    );

    registerFallbackValue(user);
  });

  test('Carregar usuário com sucesso', () async {
    when(() => mockGetUserByIdUsecase.call()).thenAnswer((_) async => user);

    await viewmodel.getUser();

    expect(viewmodel.user.value, user);
    expect(viewmodel.error.value, isNull);
    expect(viewmodel.isLoading.value, false);

    verify(() => mockGetUserByIdUsecase.call()).called(1);
  });

  test('Editar conta com sucesso', () async {
    when(() => mockGetUserByIdUsecase.call()).thenAnswer((_) async => user);
    when(() => mockEditarContaUsecase.call(any())).thenAnswer((_) async => true);

    final result = await viewmodel.editarConta('NovoNome', 'novo@email.com', 'novaSenha');

    expect(result, true);
    expect(viewmodel.error.value, isNull);
    expect(viewmodel.isLoading.value, false);
  });

  test('Deletar conta com sucesso', () async {
    viewmodel.user.value = user;

    when(() => mockDeletarContaUsecase.call(1)).thenAnswer((_) async => true);

    final result = await viewmodel.deletarUser();

    expect(result, true);
    expect(viewmodel.error.value, isNull);
    expect(viewmodel.isLoading.value, false);
  });

  test('Logout com sucesso', () async {
    when(() => mockLogoutUsecase.call()).thenAnswer((_) async => true);

    final result = await viewmodel.logoutUser();

    expect(result, true);
    expect(viewmodel.error.value, isNull);
    expect(viewmodel.isLoading.value, false);
  });
}
