import 'package:medicapp/app/modules/main/domain/repositories/iuser_repository.dart';

class DeletarContaUsecase {
  final IUserRepository userRepo;

  DeletarContaUsecase(this.userRepo);

  Future<bool> call(int userId) async {
    return await userRepo.deletarConta(userId);
  }

}