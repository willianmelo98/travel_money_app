class Gasto {
  int? idGasto;
  int idViagem;
  String categoria;
  String tipoPagamento;
  String descricao;
  double preco;
  String lugar;
  DateTime dataGasto;

  Gasto({
    this.idGasto,
    required this.idViagem,
    required this.categoria,
    required this.tipoPagamento,
    required this.descricao,
    required this.preco,
    required this.lugar,
    required this.dataGasto,
  });

  factory Gasto.fromJson(Map<String, dynamic> json) {
    return Gasto(
      idGasto: (json['idGasto'] as num).toInt(),
      idViagem: (json['idViagem'] as num).toInt(),
      categoria: json['categoria'],
      tipoPagamento: json['tipoPagamento'],
      descricao: json['descricao'],
      preco: (json['preco'] as num).toDouble(),
      lugar: json['lugar'],
      dataGasto: DateTime.parse(json['dataGasto']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idGasto': idGasto,
      'idViagem': idViagem,
      'categoria': categoria,
      'tipoPagamento': tipoPagamento,
      'descricao': descricao,
      'preco': preco,
      'lugar': lugar,
      'dataGasto': dataGasto.toIso8601String(),
    };
  }
}
