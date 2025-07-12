import 'package:flutter/material.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_all_meds_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/get_user_by_id_usecase.dart';

class HomeViewmodel extends ChangeNotifier {
  final GetAllMedsUsecase getAllMedsUsecase;
  final GetUserByIdUsecase getUserByIdUsecase;

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);

  ValueNotifier<String> username = ValueNotifier('');
  List<MedicacaoEntity> _allmeds = [];
  ValueNotifier<List<MedicacaoEntity>> meds = ValueNotifier([]);

  DateTime _dataSelecionada = DateTime.now();
  DateTime get dataSelecionada => _dataSelecionada;

  HomeViewmodel(this.getAllMedsUsecase, this.getUserByIdUsecase);

  Future<void> init() async {
    _setLoading(true);
    _allmeds.clear();
    try {
      final user = await getUserByIdUsecase.call();
      if (user != null) {
        username.value = user.name;
      }
      _allmeds = await getAllMedsUsecase.call();

      _filtrarPorDia(_dataSelecionada);
    } catch (e) {
      _setError('Erro ao carregar dados.');
    } finally {
      _setLoading(false);
    }
  }

  void selecionarData(DateTime data) {
    _dataSelecionada = data;
    _filtrarPorDia(data);
    notifyListeners();
  }

  void _filtrarPorDia(DateTime dia) {
    final auxMeds = <MedicacaoEntity>[];
    for (var med in _allmeds) {
      if (med.tomando && med.diasSemana.contains(dia.weekday)) {
        auxMeds.add(med);
      }
    }
    meds.value = auxMeds;
    notifyListeners();
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
