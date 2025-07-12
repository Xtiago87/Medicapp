import 'package:flutter/material.dart';
import 'package:medicapp/app/modules/auth/domain/entities/user_entity.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/deletar_conta_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/editar_user_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/get_user_by_id_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/logout_user_usecase.dart';

class PerfilViewmodel extends ChangeNotifier {
  final DeletarContaUsecase deletarContaUsecase;
  final GetUserByIdUsecase getUserByIdUsecase;
  final LogoutUsecase logoutUsecase;
  final EditarContaUsecase editarContaUsecase;

  PerfilViewmodel(
    this.deletarContaUsecase,
    this.getUserByIdUsecase,
    this.logoutUsecase,
    this.editarContaUsecase,
  );

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<UserEntity?> user = ValueNotifier(null);
  ValueNotifier<String?> error = ValueNotifier(null);

  Future<void> getUser() async {
    _setLoading(true);
    try {
      user.value = await getUserByIdUsecase.call();
      debugPrint('${user.value?.senha}');
      notifyListeners();
    } catch (e) {
      _setError('Erro ao carregar dados.');
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> editarConta(String name, String email, String senha) async {
    _setLoading(true);
    try {
      final user = await getUserByIdUsecase.call();
      if (user != null) {
        final editado = await editarContaUsecase.call(
          UserEntity(id: user.id, name: name, email: email, senha: senha),
        );
        return editado;
      }
      notifyListeners();
      return false;
    } catch (e) {
      _setError('Erro ao editar dados.');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> deletarUser() async {
    _setLoading(true);
    try {
      if (user.value != null) {
        final userDeleted = await deletarContaUsecase.call(
          int.parse(user.value!.id),
        );
        return userDeleted;
      }
      return false;
    } catch (e) {
      _setError('Erro ao deletar conta.');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> logoutUser() async {
    _setLoading(true);
    try {
      final userLoggedOut = await logoutUsecase.call();
      return true;
    } catch (e) {
      _setError('Erro ao realizar o logout .');
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
