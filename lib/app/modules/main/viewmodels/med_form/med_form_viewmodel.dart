import 'package:flutter/foundation.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/cadastro_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/deletar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/editar_med_usecase.dart';

class MedFormViewmodel extends ChangeNotifier {
  final CadastroMedUsecase cadastroMedUsecase;
  final DeletarMedUsecase deletarMedUsecase;
  final EditarMedUsecase editarMedUsecase;

  MedFormViewmodel(
    this.cadastroMedUsecase,
    this.deletarMedUsecase,
    this.editarMedUsecase,
  );

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

  Future<bool> salvarMedicacao({
  required String nome,
  required String observacao,
  required bool tomando,
  required List<int> diasSemana,
  required DateTime startDate,
  required DateTime endDate,
}) async {
  _setLoading(true);
  try {
    await cadastroMedUsecase.call(
      MedicacaoEntity(
        id: null,
        nome: nome,
        observacao: observacao,
        diasSemana: diasSemana,
        userId: 0,
        startDate: startDate,
        endDate: endDate, 
        tomando: tomando,
      ),
    );
    return true;
  } catch (e) {
    _setError("Erro ao salvar medicação");
    return false;
  } finally {
    _setLoading(false);
  }
}

}
