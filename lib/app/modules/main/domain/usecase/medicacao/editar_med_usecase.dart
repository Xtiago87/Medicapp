class EditarMedUsecase {
  final IMedicacaoRepository medRepository;

  EditarMedUsecase(this.medRepository);

  Future<MedicacaoEntity> call(MedicacaoEntity med) async {
      return await medRepository.editarMed(med);
  } 
}