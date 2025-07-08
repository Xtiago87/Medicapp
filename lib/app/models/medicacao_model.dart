import 'package:isar/isar.dart';
// import '../modules/main/medication_form/domain/entities/medication_entity.dart';

part 'medicacao_model.g.dart';

@Collection()
class MedicacaoModel {
  Id id = Isar.autoIncrement;

  late String name;
  late String dosagem;
  late DateTime startDate;
  late DateTime endDate;
  late List<String> horariosParaTomar;
  late bool estaTomando;
  late int userId;


  // MedicationEntity toEntity() {
  //   return MedicationEntity(
  //     id: id.toString(),
  //     name: name,
  //     dosagem: dosagem,
  //     startDate: startDate,
  //     endDate: endDate,
  //     horariosParaTomar: horariosParaTomar,
  //     estaTomando: estaTomando,
  //     userId: userId.toString(),
  //   );
  // }

  
  // static MedicacaoModel fromEntity(MedicationEntity entity) {
  //   final model = MedicacaoModel();
  //   model.id = int.tryParse(entity.id) ?? Isar.autoIncrement;
  //   model.name = entity.name;
  //   model.dosagem = entity.dosagem;
  //   model.startDate = entity.startDate;
  //   model.endDate = entity.endDate;
  //   model.horariosParaTomar = entity.horariosParaTomar;
  //   model.estaTomando = entity.estaTomando;
  //   model.userId = int.tryParse(entity.userId) ?? 0;
  //   return model;
  // }
}
