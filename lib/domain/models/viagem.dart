class Viagem {
  int? idViagem;
  String lugar;
  int orcamento;
  DateTime dataViagem;

  Viagem({
    this.idViagem,
    required this.lugar,
    required this.orcamento,
    required this.dataViagem,
  });

  factory Viagem.fromJson(Map<String, dynamic> json) {
    return Viagem(
      idViagem: (json['idViagem'] as num).toInt(),
      lugar: json['lugar'],
      orcamento: (json['orcamento'] as num).toInt(),
      dataViagem: DateTime.parse(json['dataViagem']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idviagem': idViagem,
      'lugar': lugar,
      'orcamento': orcamento,
      'dataViagem': dataViagem.toIso8601String(),
    };
  }
}
