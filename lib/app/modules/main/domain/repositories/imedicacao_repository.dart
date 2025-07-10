abstract class IMedicacaoRepository {
  Future<MedicacaoEntity> cadastrarMed(MedicacaoEntity med);
  Future<bool> deletarMed(int medId);
  Future<bool> editarMed(MedicacaoEntity med);
  Future<List<MedicacaoEntity>> getAllMeds();
  Future<MedicacaoEntity?> getMedById(int medId);
}