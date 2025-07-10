class GetMedByIdUsecase {
  final IMedicacaoRepository medRepository;

  GetMedByIdUsecase(this.medRepository);

  Future<MedicacaoEntity> call(int medId) async {
      return await medRepository.getAllMeds();
  } 
}