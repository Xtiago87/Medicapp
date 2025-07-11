import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<UserEntity?> getUserById();
  Future<bool> editarUser(UserEntity user);
  Future<bool> deletarConta(int id);
  Future<void> logoutUser();
}
