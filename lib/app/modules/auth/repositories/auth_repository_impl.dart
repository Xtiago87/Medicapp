import 'package:flutter/foundation.dart';
import 'package:medicapp/app/core/services/isar_service_db.dart';
import 'package:medicapp/app/core/services/sharedpreferences_service.dart';
import 'package:medicapp/app/modules/auth/domain/entities/dados_login.dart';
import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/auth/domain/repositories/iauth_repository.dart';
import '../../../models/user_model.dart';


class AuthRepositoryImpl implements IAuthRepository {
  final IsarServiceDB _isarService;
  final SharedPreferencesService sharedPreferencesService;

  AuthRepositoryImpl(this._isarService, this.sharedPreferencesService);

  @override
  Future<UserEntity?> login(DadosLoginEntity credentials) async {
    final userModel = await _isarService.findUserByEmail(credentials.email);

    if (userModel == null) return null;

    if (userModel.senha != credentials.password) {
      return null;
    }
    debugPrint('loged user = ${userModel.id}');
    debugPrint('loged user = ${userModel.email}');
    sharedPreferencesService.saveLoggedUserId(userModel.id);
    return userModel.toEntity();
  }

  @override
  Future<UserEntity> cadastro(UserEntity user,) async {
    final existing = await _isarService.findUserByEmail(user.email);

    if (existing != null) {
      throw Exception('E-mail já cadastrado');
    }

    final newUser = UserModel.fromEntity(user);
    await _isarService.saveUser(newUser);

    return newUser.toEntity();
  }

  @override
  Future<void> resetarSenha(String email) async {
    final user = await _isarService.findUserByEmail(email);
    if (user == null) {
      throw Exception('E-mail não encontrado');
    }

    await Future.delayed(const Duration(milliseconds: 300));
  }
}
