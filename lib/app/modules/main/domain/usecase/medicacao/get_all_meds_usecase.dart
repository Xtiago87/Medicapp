import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/imedicacao_repository.dart';


class GetAllMedsUsecase {
  final IMedicacaoRepository medRepository;

  GetAllMedsUsecase(this.medRepository);

  Future<List<MedicacaoEntity>> call() async {
      return await medRepository.getAllMeds();
  } 
}