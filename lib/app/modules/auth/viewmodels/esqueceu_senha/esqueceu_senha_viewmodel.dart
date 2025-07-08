import 'package:flutter/material.dart';
import 'package:medicapp/app/modules/auth/domain/usecases/esqueceu_senha/esqueceu_senha_usecase.dart';


class EsqueceuSenhaViewmodel extends ChangeNotifier {
  final EsqueceuSenhaUsecase _esqueceuSenhaUsecase;

  bool _isLoading = false;
  String? _error;
  bool _sent = false;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get sent => _sent;

  EsqueceuSenhaViewmodel(this._esqueceuSenhaUsecase);

  Future<void> sendReset(String email) async {
    _setLoading(true);
    _error = null;
    _sent = false;

    try {
      await _esqueceuSenhaUsecase.call(email);
      _sent = true;
    } catch (e) {
      _error = e.toString();
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
