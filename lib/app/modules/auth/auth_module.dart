import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/core/services/isar_service_db.dart';
import 'package:medicapp/app/modules/auth/domain/repositories/iauth_repository.dart';
import 'package:medicapp/app/modules/auth/domain/usecases/cadastro/cadastro_usecase.dart';
import 'package:medicapp/app/modules/auth/domain/usecases/esqueceu_senha/esqueceu_senha_usecase.dart';
import 'package:medicapp/app/modules/auth/domain/usecases/login/login_usecase.dart';
import 'package:medicapp/app/modules/auth/pages/cadastro/cadastro_page.dart';
import 'package:medicapp/app/modules/auth/pages/esqueceu_senha/esqueceu_senha_page.dart';
import 'package:medicapp/app/modules/auth/pages/login/login_page.dart';
import 'package:medicapp/app/modules/auth/viewmodels/cadastro/cadastro_viewmodel.dart';
import 'package:medicapp/app/modules/auth/viewmodels/esqueceu_senha/esqueceu_senha_viewmodel.dart';
import 'package:medicapp/app/modules/auth/viewmodels/login/login_viewmodel.dart';
import 'package:medicapp/app_module.dart';
import 'repositories/auth_repository_impl.dart';


class AuthModule extends Module {
  @override
  void binds(Injector i) {
  i.add<IAuthRepository>(AuthRepositoryImpl.new);

  i.add<LoginUsecase>(LoginUsecase.new);
  i.add<CadastroUsecase>(CadastroUsecase.new);
  i.add<EsqueceuSenhaUsecase>(EsqueceuSenhaUsecase.new);

  i.add<LoginViewModel>(LoginViewModel.new);
  i.add<EsqueceuSenhaViewmodel>(EsqueceuSenhaViewmodel.new);
  i.add<CadastroViewmodel>(CadastroViewmodel.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
    r.child('/cadastro', child: (_) => const CadastroPage());
    r.child('/esqueceu_senha', child: (_) => const EsqueceuSenhaPage());
  }

  @override
  List<Module> get imports => [
    AppModule()
  ];
}
