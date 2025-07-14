import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:medicapp/app/models/medicacao_model.dart';
import 'package:medicapp/app/models/user_model.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:path_provider/path_provider.dart';

class IsarServiceDB {
  late final Isar _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      UserModelSchema,
      MedicacaoModelSchema,
    ], directory: dir.path);
  }

  IsarServiceDB() {
    init();
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

  Future<UserModel?> findUserById(int id) async {
    return await _isar.userModels.filter().idEqualTo(id).findFirst();
  }

  Future<bool> deleteUser(int id) async {
    bool userDeleted = false;
    await _isar.writeTxn(() async {
      userDeleted = await _isar.userModels.delete(id);
    });
    return userDeleted;
  }

  Future<void> saveMedication(MedicacaoModel med) async {
    await _isar.writeTxn(() async {
      await _isar.medicacaoModels.put(med);
    });
  }

  Future<List<MedicacaoModel>> getMedicationsByUser(int userId) async {
    return await _isar.medicacaoModels.filter().userIdEqualTo(userId).findAll();
  }

  Future<bool> deleteMedicacao(int medId) async {
    bool medDeleted = false;
    await _isar.writeTxn(() async {
      medDeleted = await _isar.medicacaoModels.delete(medId);
    });
    return medDeleted;
  }

  Future<MedicacaoEntity?> getMedicacaoById(int medId) async {
    final med = await _isar.medicacaoModels.get(medId);
    if (med != null) {
      return med.toEntity();
    }
    return null;
  }
}
