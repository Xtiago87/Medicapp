
import 'package:flutter/foundation.dart';
import 'package:medicapp/app/core/services/isar_service_db.dart';
import 'package:medicapp/app/core/services/sharedpreferences_service.dart';
import 'package:medicapp/app/models/medicacao_model.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/imedicacao_repository.dart';

class MedicacaoRepositoryImpl implements IMedicacaoRepository {
  final IsarServiceDB _isar;
  final SharedPreferencesService _sharedPreferencesService;

  MedicacaoRepositoryImpl(this._isar, this._sharedPreferencesService);

  @override
  Future<MedicacaoEntity> cadastrarMed(MedicacaoEntity med) async {
    final userId = await _sharedPreferencesService.getLoggedUserId();
    await _isar.saveMedication(MedicacaoModel.fromEntity(med, userId));
    return med;
  }

  @override
  Future<bool> deletarMed(int medId) async {
    return await _isar.deleteMedicacao(medId);
  }

  @override
  Future<bool> editarMed(MedicacaoEntity med) async {
    final userId = await _sharedPreferencesService.getLoggedUserId();
    await _isar.saveMedication(MedicacaoModel.fromEntity(med, userId));
    return true;
  }

  @override
  Future<List<MedicacaoEntity>> getAllMeds() async {
    final userId = await _sharedPreferencesService.getLoggedUserId();
    final allMeds = await _isar.getMedicationsByUser(userId);
    final auxMeds = <MedicacaoEntity>[];
    for (var element in allMeds) {
      auxMeds.add(element.toEntity());
    }
    return auxMeds;
  }

  @override
  Future<MedicacaoEntity?> getMedById(int medId) async {
    return await _isar.getMedicacaoById(medId);
  }
}
