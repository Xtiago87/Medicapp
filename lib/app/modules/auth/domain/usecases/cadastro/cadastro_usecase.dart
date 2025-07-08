import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/auth/domain/repositories/iauth_repository.dart';



class CadastroUsecase {
  final IAuthRepository _repository;

  CadastroUsecase(this._repository);

  Future<UserEntity> call(UserEntity user, String password) {
    return _repository.cadastro(user, password);
  }
}
