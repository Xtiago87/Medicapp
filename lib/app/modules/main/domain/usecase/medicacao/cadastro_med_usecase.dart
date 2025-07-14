import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/imedicacao_repository.dart';

class CadastroMedUsecase {
  final IMedicacaoRepository medRepository;

  CadastroMedUsecase(this.medRepository);

  Future<MedicacaoEntity> call(MedicacaoEntity med) async {
      return await medRepository.cadastrarMed(med);
  } 
}