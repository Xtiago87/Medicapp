import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';
import 'package:medicapp/app/modules/main/domain/repositories/imedicacao_repository.dart';


class GetMedByIdUsecase {
  final IMedicacaoRepository medRepository;

  GetMedByIdUsecase(this.medRepository);

  Future<MedicacaoEntity?> call(int medId) async {
      return await medRepository.getMedById(medId);
  } 
}