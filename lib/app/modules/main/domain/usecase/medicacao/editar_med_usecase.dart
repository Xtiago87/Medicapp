import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/imedicacao_repository.dart';


class EditarMedUsecase {
  final IMedicacaoRepository medRepository;

  EditarMedUsecase(this.medRepository);

  Future<bool> call(MedicacaoEntity med) async {
      return await medRepository.editarMed(med);
  } 
}