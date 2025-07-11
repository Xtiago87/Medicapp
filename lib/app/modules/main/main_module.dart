import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/main/pages/historico/historico_page.dart';
import 'package:medicapp/app/modules/main/pages/home/home_page.dart';
import 'package:medicapp/app/modules/main/pages/med_form/medicacao_form_page.dart';
import 'package:medicapp/app/modules/main/pages/nav/nav_page.dart';
import 'package:medicapp/app/modules/main/pages/perfil/perfil_page.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const NavPage(),
      children: [
        ChildRoute('/home', child: (_) => const HomePage()),
        ChildRoute('/historico', child: (_) => const HistoricoPage()),
        ChildRoute('/med_form', child: (_) => const MedicacaoFormPage()),
        ChildRoute('/perfil', child: (_) => const PerfilPage()),
        
      ],
    );
  }
}
