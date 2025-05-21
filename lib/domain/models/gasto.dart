class Gasto {
  int? idGasto;
  int idViagem;
  int categoria;
  int meioDePagamento;
  String titleGasto;
  double preco;
  DateTime dataGasto;

  Gasto({
    this.idGasto,
    required this.idViagem,
    required this.categoria,
    required this.meioDePagamento,
    required this.titleGasto,
    required this.preco,
    required this.dataGasto,
  });

  factory Gasto.fromJson(Map<String, dynamic> json) {
    return Gasto(
      idGasto: (json['idGasto'] as num).toInt(),
      idViagem: (json['idViagem'] as num).toInt(),
      categoria: (json['categoria'] as num).toInt(),
      meioDePagamento: (json['meioDePagamento'] as num).toInt(),
      titleGasto: json['titleGasto'],
      preco: (json['preco'] as num).toDouble(),
      dataGasto: DateTime.parse(json['dataGasto']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idGasto': idGasto,
      'idViagem': idViagem,
      'categoria': categoria,
      'meioDePagamento': meioDePagamento,
      'titleGasto': titleGasto,
      'preco': preco,
      'dataGasto': dataGasto.toIso8601String(),
    };
  }
}
