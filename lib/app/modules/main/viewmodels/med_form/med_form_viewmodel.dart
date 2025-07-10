class MedFormViewmodel extends ChangeNotifier{

  final CadastroMedUsecase cadastroMedUsecase;
  final DeletarMedUsecase deletarMedUsecase;
  final EditarMedUsecase editarMedUsecase;

  MedFormViewmodel(this.cadastroMedUsecase, this.deletarMedUsecase, this.editarMedUsecase);

    ValueNotifier<bool> isLoading = ValueNotifier(false);
    ValueNotifier<String?> error = ValueNotifier(null);

  void _setLoading(bool value) {
    isLoading.value = value;
    notifyListeners();
  }

  void _setError(String? value) {
    error.value = value;
    notifyListeners();
  }

}