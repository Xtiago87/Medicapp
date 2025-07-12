import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/imedicacao_repository.dart';


class DeletarMedUsecase {
  final IMedicacaoRepository medRepository;

  DeletarMedUsecase(this.medRepository);

  Future<bool> call(int medId) async {
      return await medRepository.deletarMed(medId);
  } 
}