class MedicacaoEntity {
  final int? id;
  final String nome;
  final String observacao;
  final bool tomando;
  final List<int> diasSemana;
  final int userId;
  final DateTime startDate;
  final DateTime endDate;

  MedicacaoEntity({
    required this.id,
    required this.nome,
    required this.observacao,
    required this.tomando,
    required this.diasSemana,
    required this.userId,
    required this.startDate, 
    required this.endDate
  });
}
