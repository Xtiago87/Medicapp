import 'package:isar/isar.dart';
import '../modules/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@Collection()
class UserModel {
  Id id = Isar.autoIncrement;

  late String name;
  late String email;
  late String senha;

  UserEntity toEntity() {
    return UserEntity(
      id: id.toString(),
      name: name,
      email: email, 
      senha: senha,
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    final model = UserModel();
    model.id = int.tryParse(entity.id) ?? Isar.autoIncrement;
    model.name = entity.name;
    model.email = entity.email;
    model.senha = entity.senha;
    return model;
  }
}
