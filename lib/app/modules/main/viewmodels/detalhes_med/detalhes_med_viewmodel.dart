import 'package:flutter/foundation.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/cadastro_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/deletar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/editar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_med_id_usecase.dart';

class DetalhesMedViewmodel extends ChangeNotifier {
  final GetMedByIdUsecase getMedByIdUsecase;
  final DeletarMedUsecase deletarMedUsecase;
  final EditarMedUsecase editarMedUsecase;

  DetalhesMedViewmodel(
    this.getMedByIdUsecase,
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

  Future<bool> editarMedicacao({
    required String nome,
    required String observacao,
    required bool tomando,
    required List<int> diasSemana,
    required DateTime startDate,
    required DateTime endDate,
    required int id,
  }) async {
    _setLoading(true);
    try {
      await editarMedUsecase.call(
        MedicacaoEntity(
          id: id,
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

  Future<bool> deleteMed(int medId) async {
    try {
      _setLoading(true);
      final result = await deletarMedUsecase.call(medId);
      return result;
    } catch (e) {
      _setError("Erro ao deletar medicação");
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<MedicacaoEntity?> getMed(int medId) async {
    try {
      _setLoading(true);
      final result = await getMedByIdUsecase.call(medId);
      if (result != null) {
        return result;
      }
      return null;
    } catch (e) {
      _setError("Erro ao carregar medicação");
      return null;
    } finally {
      _setLoading(false);
    }
  }
}
