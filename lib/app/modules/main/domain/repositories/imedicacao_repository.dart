import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';

abstract class IMedicacaoRepository {
  Future<MedicacaoEntity> cadastrarMed(MedicacaoEntity med);
  Future<bool> deletarMed(int medId);
  Future<bool> editarMed(MedicacaoEntity med);
  Future<List<MedicacaoEntity>> getAllMeds();
  Future<MedicacaoEntity?> getMedById(int medId);
}