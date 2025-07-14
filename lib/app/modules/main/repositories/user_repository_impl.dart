import 'package:medicapp/app/core/services/isar_service_db.dart';
import 'package:medicapp/app/core/services/sharedpreferences_service.dart';
import 'package:medicapp/app/models/user_model.dart';
import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/iuser_repository.dart';


class UserRepositoryImpl implements IUserRepository {
  final IsarServiceDB _isar;
  final SharedPreferencesService _sharedPreferences;

  UserRepositoryImpl(this._isar, this._sharedPreferences);

  @override
  Future<UserEntity?> getUserById() async {
    final loggedUser = await _sharedPreferences.getLoggedUserId();
    final user = await _isar.findUserById(loggedUser);
    if(user != null){
      return user.toEntity();
    }
    return null;
  }

  @override
  Future<bool> editarUser(UserEntity user) async {
    await _isar.saveUser(UserModel.fromEntity(user));
    return true;
  }

  @override
  Future<bool> deletarConta(int id) async {
    return await _isar.deleteUser(id);
  }

  @override
  Future<void> logoutUser() async {
    await _sharedPreferences.logoutUser();
  }
}
