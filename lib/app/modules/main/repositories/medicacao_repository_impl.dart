
class MedicacaoRepositoryImpl implements IMedicacaoRepository {
  final IsarServiceDB _isar;

  MedicacaoRepositoryImpl(this._isar);

  @override
  Future<MedicacaoEntity> cadastrarMed(MedicacaoEntity med) async {
    await _isar.saveMedicacao(med);
    return med;
  }

  @override
  Future<bool> deletarMed(int medId) async {
    return await _isar.deleteMedicacao(medId);
  }

  @override
  Future<MedicacaoEntity> editarMed(MedicacaoEntity med) async {
    await _isar.saveMedicacao(med);
    return med;
  }

  @override
  Future<List<MedicacaoEntity>> getAllMeds() async {
    return await _isar.getMedicacoes();
  }

  @override
  Future<MedicacaoEntity> getMedById(int medId) async {
    return await _isar.getMedicacaoById(medId);
  }
}
