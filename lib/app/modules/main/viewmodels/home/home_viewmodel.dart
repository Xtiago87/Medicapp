class HomeViewmodel extends ChangeNotifier {
final GetAllMedsUsecase getAllMedsUsecase;
final GetUserByIdUsecase getUserByIdUsecase;

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);

  ValueNotifier<String> username = ValueNotifier('');
  List<MedicacaoEntity> _allmeds = ValueNotifier([]);
  ValueNotifier<List<MedicacaoEntity>> meds = ValueNotifier([]);

  DateTime _dataSelecionada = DateTime.now();
  DateTime get dataSelecionada => _dataSelecionada;

  HomeViewmodel(this.getAllMedsUsecase, this.getUserByIdUsecase);

  Future<void> init() async {
      _setLoading(true);

    try {
      username.value = await getUserByIdUsecase.call().name;
      _allmeds = await getAllMedsUsecase.call();

      filtrarPorDia(_dataSelecionada);
    } catch (e) {
      erro = 'Erro ao carregar dados.';
    } finally {
      _setLoading(false);
    }
  }

Map<int, int> getMedsPorDia() {
  final Map<int, int> medsPorDia = {
    1: 0, 
    2: 0, 
    3: 0, 
    4: 0, 
    5: 0, 
    6: 0, 
    7: 0, 
  };

  for (final med in _allmeds) {
    final dia = med.diaSemana;
    if (medsPorDia.containsKey(dia)) {
      medsPorDia[dia] = medsPorDia[dia]! + 1;
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
    meds.value = _allmeds.where((med) {
      return med.diaSemana == dia.weekday;
    }).toList();
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