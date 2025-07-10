class DeletarMedUsecase {
  final IMedicacaoRepository medRepository;

  DeletarMedUsecase(this.medRepository);

  Future<bool> call(int medId) async {
      return await medRepository.deletarMed(medId);
  } 
}