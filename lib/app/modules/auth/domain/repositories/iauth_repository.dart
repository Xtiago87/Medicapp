import 'package:medicapp/app/modules/auth/domain/entities/dados_login.dart';
import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';

abstract class IAuthRepository {
  Future<UserEntity?> login(DadosLoginEntity credentials);
  Future<UserEntity> cadastro(UserEntity user);
  Future<void> resetarSenha(String email);
}
