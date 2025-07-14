

import 'package:medicapp/app/modules/auth/domain/entities/dados_login.dart';
import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/auth/domain/repositories/iauth_repository.dart';

class LoginUsecase {
  final IAuthRepository _repository;

  LoginUsecase(this._repository);

  Future<UserEntity?> call(DadosLoginEntity dados) {
    return _repository.login(dados);
  }
}
