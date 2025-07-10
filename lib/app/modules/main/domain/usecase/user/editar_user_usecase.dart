class EditarContaUsecase {
  final IUserRepository userRepo;

  EditarContaUsecase(this.userRepo);

  Future<bool> call(UserEntity user) async {
    return await userRepo.editarUser(user);
  }

}