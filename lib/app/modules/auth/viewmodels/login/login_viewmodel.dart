import 'package:flutter/material.dart';
import 'package:medicapp/app/modules/auth/domain/entities/dados_login.dart';
import 'package:medicapp/app/modules/auth/domain/usecases/login/login_usecase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUsecase _loginUsecase;

  bool _loading = false;
  String? _error;

  bool get isLoading => _loading;
  String? get error => _error;

  LoginViewModel(this._loginUsecase);

  Future<void> login(String email, String password) async {
    _setLoading(true);
    _error = null;

    try {
      final dadosLogin = DadosLoginEntity(email: email, password: password);
      final user = await _loginUsecase.call(dadosLogin);

      if (user == null) {
        _error = 'Usuário ou senha inválidos';
      } else {
        //TODO
      }
    } catch (e) {
      _error = 'Erro inesperado: ${e.toString()}';
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
