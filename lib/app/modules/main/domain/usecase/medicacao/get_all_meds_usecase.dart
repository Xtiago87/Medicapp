class GetAllMedsUsecase {
  final IMedicacaoRepository medRepository;

  GetAllMedsUsecase(this.medRepository);

  Future<List<MedicacaoEntity>> call() async {
      return await medRepository.getMedById(medId);
  } 
}