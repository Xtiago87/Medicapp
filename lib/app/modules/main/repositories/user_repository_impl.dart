import 'package:your_app/app/core/services/isar_service.dart';
import 'package:your_app/app/core/domain/entities/user_entity.dart';
import 'package:your_app/app/modules/main/profile/interfaces/i_user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  final IsarServiceDB _isar;

  UserRepositoryImpl(this._isar);

  @override
  Future<UserEntity?> getUserById(int id) async {
    return await _isar.getUserById(id);
  }

  @override
  Future<UserEntity> editarUser(UserEntity user) async {
    await _isar.saveUser(user);
    return user;
  }

  @override
  Future<bool> deletarConta(int id) async {
    return await _isar.deleteUser(id);
  }

  @override
  Future<void> logoutUser() async {
    await _isar.clearCurrentUser();
  }
}
