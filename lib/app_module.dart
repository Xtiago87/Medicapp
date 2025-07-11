import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/core/services/isar_service_db.dart';

import 'package:medicapp/app/modules/auth/auth_module.dart';
import 'package:medicapp/app/modules/main/main_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IsarServiceDB>(IsarServiceDB.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
    r.module('/main', module: MainModule());
  }
}
