import 'package:isar/isar.dart';
import 'package:medicapp/app/modules/main/domain/entites/medicacao_entity.dart';

part 'medicacao_model.g.dart';

@Collection()
class MedicacaoModel {
  Id id = Isar.autoIncrement;

  late String name;
  late String observacao;
  late DateTime startDate;
  late DateTime endDate;
  late List<int> diasSemana;
  late bool estaTomando;
  late int userId;


  MedicacaoEntity toEntity() {
    return MedicacaoEntity(
      id: id,
      nome: name,
      observacao: observacao,
      startDate: startDate,
      endDate: endDate,
      diasSemana: diasSemana,
      tomando: estaTomando,
      userId: userId,
    );
  }

  
  static MedicacaoModel fromEntity(MedicacaoEntity entity, int userId) {
    final model = MedicacaoModel();
    model.id = entity.id ?? Isar.autoIncrement;
    model.name = entity.nome;
    model.observacao = entity.observacao;
    model.startDate = entity.startDate;
    model.endDate = entity.endDate;
    model.diasSemana = entity.diasSemana;
    model.estaTomando = entity.tomando;
    model.userId = userId;
    return model;
  }
}
