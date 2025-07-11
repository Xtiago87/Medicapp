import 'package:flutter/material.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/cadastro_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/deletar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/editar_med_usecase.dart';

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