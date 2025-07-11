import 'package:flutter/material.dart';
import 'package:medicapp/app/modules/auth/domain/usecases/cadastro/cadastro_usecase.dart';
import '../../domain/entities/user_entity.dart';

class CadastroViewmodel extends ChangeNotifier {
  final CadastroUsecase _cadastroUsecase;

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<String?> error = ValueNotifier(null);

  CadastroViewmodel(this._cadastroUsecase);

  Future<bool> cadastrar(String nome, String email, String senha) async {
    _setLoading(true);
    _setError(null);
    notifyListeners();

    try {
      final sucesso = await _cadastroUsecase.call(
        UserEntity(id: '', name: nome, email: email, senha: senha),
      );
      return true;
    } catch (e, stack) {
      print('[CadastroViewmodel] Erro: $e\n$stack');
      _setError('Falha ao salvar usuário. Tente novamente.');
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
