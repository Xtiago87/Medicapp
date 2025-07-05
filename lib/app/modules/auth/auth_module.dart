import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/auth/pages/cadastro/cadastro_page.dart';
import 'package:medicapp/app/modules/auth/pages/esqueceu_senha/esqueceu_senha_page.dart';
import 'package:medicapp/app/modules/auth/pages/login/login_page.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
    r.child('/cadastro', child: (_) => const CadastroPage());
    r.child('/esqueceu_senha', child: (context) => EsqueceuSenhaPage());
  }
}
