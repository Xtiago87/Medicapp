class PerfilViewmodel extends ChangeNotifier {
  final DeletarContaUsecase deletarContaUsecase;
  final GetUserByIdUsecase getUserByIdUsecase;
  final LogoutUsecase logoutUsecase;

  PerfilViewmodel(this.deletarContaUsecase, this.getUserByIdUsecase, this.logoutUsecase);

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<UserEntity?> user = ValueNotifier(null);
  ValueNotifier<String?> error = ValueNotifier(null);



  Future<void> getUser() async {
    _setLoading(true);
    try {
      user.value = await getUserByIdUsecase.call();
      
      notifyListeners()
    } catch (e) {
      erro.value = 'Erro ao carregar dados.';
    } finally {
      _setLoading(false);
    }
  }


    Future<bool> deletarUser() async {
    _setLoading(true);
    try {
      final userDeleted = await deletarContaUsecase.call(user.value.id);
      return userDeleted;
    } catch (e) {
      erro.value = 'Erro ao deletar conta.';
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> logoutUser() async {
    _setLoading(true);
    try {
      final userLoggedOut = await logoutUsecase.call();
      return userLoggedOut;
    } catch (e) {
      erro.value = 'Erro ao realizar o logout .';
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading.value = value;
    notifyListeners();
  }

  void _setError(String? value) {
    error.value = value;
    notifyListeners();
  }

}