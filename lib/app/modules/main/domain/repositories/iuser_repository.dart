abstract class IUserRepository {
  Future<UserEntity?> getUserById(int id);
  Future<bool> editarUser(UserEntity user);
  Future<bool> deletarConta(int id);
  Future<void> logoutUser();
}
