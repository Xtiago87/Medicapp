import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/auth/domain/entities/dados_login.dart';
import 'package:medicapp/app/modules/auth/domain/usecases/login/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUsecase _loginUsecase = Modular.get<LoginUsecase>();

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);

  LoginViewModel();

  Future<bool> login(String email, String password) async {
    _setLoading(true);

    try {
      _setError(null);
      final dadosLogin = DadosLoginEntity(email: email, password: password);
      final user = await _loginUsecase.call(dadosLogin);

      if (user == null) {
        _setError('Usuário ou senha inválidos');
      }
      return true;
    } catch (e) {
      debugPrint('error ${e}');
      _setError('Erro inesperado: ${e.toString()}');
      return false;
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
