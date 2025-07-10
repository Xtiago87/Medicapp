class GetUserByIdUsecase {
  final IUserRepository userRepo;

  GetUserByIdUsecase(this.userRepo);

  Future<UserEntity?> call(int userId) async {
    return await userRepo.getUserById(userId);
  }

}