import 'package:medicapp/app/modules/auth/domain/repositories/iauth_repository.dart';

class EsqueceuSenhaUsecase {
  final IAuthRepository _repository;

  EsqueceuSenhaUsecase(this._repository);

  Future<void> call(String email) {
    return _repository.resetarSenha(email);
  }
}
