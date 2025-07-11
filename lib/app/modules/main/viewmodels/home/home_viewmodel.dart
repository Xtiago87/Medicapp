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

    try {
      final user = await getUserByIdUsecase.call();
      if(user != null){
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

Map<int, int> getMedsPorDia() {
  final Map<int, int> medsPorDia = {
    1: 0, // Segunda
    2: 0, // Terça
    3: 0, // Quarta
    4: 0, // Quinta
    5: 0, // Sexta
    6: 0, // Sábado
    7: 0, // Domingo
  };

  for (final med in _allmeds) {
    for (final dia in med.diasSemana) {
      if (medsPorDia.containsKey(dia)) {
        medsPorDia[dia] = medsPorDia[dia]! + 1;
      }
    }
  }

  return medsPorDia;
}

  void selecionarData(DateTime data) {
    _dataSelecionada = data;
    _filtrarPorDia(data);
    notifyListeners();
  }

  void _filtrarPorDia(DateTime dia) {
    final auxMeds = <MedicacaoEntity>[];
    for (var med in meds.value) {
      for (var element in med.diasSemana) {
        if(element == dia.weekday){
          auxMeds.add(med);
        }
      ;}
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