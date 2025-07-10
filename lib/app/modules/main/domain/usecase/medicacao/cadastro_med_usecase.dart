class CadastroMedUsecase {
  final IMedicacaoRepository medRepository;

  CadastroMedUsecase(this.medRepository);

  Future<MedicacaoEntity> call(MedicacaoEntity med) async {
      return await medRepository.cadastrarMed(med);
  } 
}