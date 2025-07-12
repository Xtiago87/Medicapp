import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/iuser_repository.dart';

class EditarContaUsecase {
  final IUserRepository userRepo;

  EditarContaUsecase(this.userRepo);

  Future<bool> call(UserEntity user) async {
    return await userRepo.editarUser(user);
  }

}