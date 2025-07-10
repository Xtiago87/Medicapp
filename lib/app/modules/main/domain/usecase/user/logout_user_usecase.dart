class LogoutUsecase {
  final IUserRepository userRepo;

  LogoutUsecase(this.userRepo);

  Future<void> call() async {
    return await userRepo.logoutUser();
  }

}