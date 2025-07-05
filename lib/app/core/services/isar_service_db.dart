import 'package:isar/isar.dart';
import 'package:medicapp/app/models/medicacao_model.dart';
import 'package:medicapp/app/models/user_model.dart';
import 'package:path_provider/path_provider.dart';


class IsarServiceDB {
  late final Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [UserModelSchema, MedicacaoModelSchema],
      directory: dir.path,
    );
  }

  Isar get isar => _isar;

  Future<void> saveUser(UserModel user) async {
    await _isar.writeTxn(() async {
      await _isar.userModels.put(user);
    });
  }

  Future<List<UserModel>> getAllUsers() async {
    return await _isar.userModels.where().findAll();
  }

  Future<UserModel?> findUserByEmail(String email) async {
    return await _isar.userModels.filter().emailEqualTo(email).findFirst();
  }

  Future<void> deleteUser(int id) async {
    await _isar.writeTxn(() async {
      await _isar.userModels.delete(id);
    });
  }


  Future<void> saveMedication(MedicacaoModel med) async {
    await _isar.writeTxn(() async {
      await _isar.medicacaoModels.put(med);
    });
  }

  Future<List<MedicacaoModel>> getMedicationsByUser(int userId) async {
    return await _isar.medicacaoModels
        .filter()
        .userIdEqualTo(userId)
        .findAll();
  }
}
