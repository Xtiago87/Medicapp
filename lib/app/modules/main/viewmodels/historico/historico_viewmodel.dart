import 'package:flutter/material.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_all_meds_usecase.dart';

class HistoricoViewmodel extends ChangeNotifier {
  final GetAllMedsUsecase _getAllMedsUsecase;

    
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);

  
  final List<MedicacaoEntity> _allMeds = [];
  ValueNotifier<List<MedicacaoEntity>> meds = ValueNotifier([]);

  String searchQuery = '';
  String selectedFilter = 'Todos';
  final List<String> filters = ['Todos', 'Tomando', 'Finalizado'];

  HistoricoViewmodel(this._getAllMedsUsecase);

  Future<void> init() async {
    _setLoading(true);
    try {
      final lista = await _getAllMedsUsecase.call();
      _allMeds.addAll(lista);
      _applyFilters();
    } catch (e) {
      _setError('Erro ao carregar histórico');
    } finally {
      _setLoading(false);
    }
  }

  void setSearchQuery(String query) {
    searchQuery = query;
    _applyFilters();
  }


  void setFilter(String filter) {
    selectedFilter = filter;
    _applyFilters();
  }

  void _applyFilters() {
    List<MedicacaoEntity> lista = _allMeds;

    if (selectedFilter != 'Todos') {
      final emUso = selectedFilter == 'Tomando';
      lista = lista.where((med) => med.tomando == emUso).toList();
    }

    if (searchQuery.isNotEmpty) {
      final q = searchQuery.toLowerCase();
      lista = lista.where((med) => med.nome.toLowerCase().contains(q)).toList();
    }

    meds.value = lista;
    notifyListeners();
  }

  void _setLoading(bool v) {
    isLoading.value = v;
    notifyListeners();
  }

  void _setError(String? msg) {
    error.value = msg;
    notifyListeners();
  }
}
