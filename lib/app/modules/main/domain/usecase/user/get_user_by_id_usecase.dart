import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/iuser_repository.dart';

class GetUserByIdUsecase {
  final IUserRepository userRepo;

  GetUserByIdUsecase(this.userRepo);

  Future<UserEntity?> call() async {
    return await userRepo.getUserById();
  }

}