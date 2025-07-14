import 'package:flutter_modular/flutter_modular.dart';
import 'package:medicapp/app/modules/main/domain/repositories/imedicacao_repository.dart';
import 'package:medicapp/app/modules/main/domain/repositories/iuser_repository.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/cadastro_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/deletar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/editar_med_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_all_meds_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/medicacao/get_med_id_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/deletar_conta_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/editar_user_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/get_user_by_id_usecase.dart';
import 'package:medicapp/app/modules/main/domain/usecase/user/logout_user_usecase.dart';
import 'package:medicapp/app/modules/main/pages/detalhes_med/detalhes_med_page.dart';
import 'package:medicapp/app/modules/main/pages/historico/historico_page.dart';
import 'package:medicapp/app/modules/main/pages/home/home_page.dart';
import 'package:medicapp/app/modules/main/pages/med_form/medicacao_form_page.dart';
import 'package:medicapp/app/modules/main/pages/nav/nav_page.dart';
import 'package:medicapp/app/modules/main/pages/perfil/perfil_page.dart';
import 'package:medicapp/app/modules/main/repositories/medicacao_repository_impl.dart';
import 'package:medicapp/app/modules/main/repositories/user_repository_impl.dart';
import 'package:medicapp/app/modules/main/viewmodels/detalhes_med/detalhes_med_viewmodel.dart';
import 'package:medicapp/app/modules/main/viewmodels/historico/historico_viewmodel.dart';
import 'package:medicapp/app/modules/main/viewmodels/home/home_viewmodel.dart';
import 'package:medicapp/app/modules/main/viewmodels/med_form/med_form_viewmodel.dart';
import 'package:medicapp/app/modules/main/viewmodels/perfil/perfil_viewmodel.dart';
import 'package:medicapp/app_module.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {

    i.addSingleton<IMedicacaoRepository>(MedicacaoRepositoryImpl.new);
    i.addSingleton<IUserRepository>(UserRepositoryImpl.new);
    
    i.add(CadastroMedUsecase.new);
    i.add(DeletarMedUsecase.new);
    i.add(EditarMedUsecase.new);
    i.add(GetAllMedsUsecase.new);
    i.add(GetMedByIdUsecase.new);

    i.add(DeletarContaUsecase.new);
    i.add(EditarContaUsecase.new);
    i.add(GetUserByIdUsecase.new);
    i.add(LogoutUsecase.new);

    i.add(HomeViewmodel.new);
    i.add(PerfilViewmodel.new);
    i.add(MedFormViewmodel.new);
    i.add(HistoricoViewmodel.new);
    i.add(DetalhesMedViewmodel.new);

  }

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
    r.child('/detalhes_med/:id', child: (context) => DetalhesMedPage(medId: int.parse(r.args.params['id']),),);
  }

  @override
  List<Module> get imports => [
    AppModule(),
  ];
}
