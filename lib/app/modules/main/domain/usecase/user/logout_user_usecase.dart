import 'package:medicapp/app/modules/main/domain/repositories/iuser_repository.dart';

class LogoutUsecase {
  final IUserRepository userRepo;

  LogoutUsecase(this.userRepo);

  Future<void> call() async {
    return await userRepo.logoutUser();
  }

}