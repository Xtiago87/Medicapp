import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/home_screen.dart';
import 'package:medicapp/app/modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {

  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
  }
}
