import 'package:flutter/material.dart';

import 'package:travel_money_app/data/local_storage/dao/gasto_dao.dart';
import 'package:travel_money_app/domain/models/gasto.dart';

class GastoStore with ChangeNotifier {
  int idViagem;
  GastoStore({
    required this.idViagem,
  }) {
    getGastosDaViagem();
  }

  Map<int, String> idCategoryToIconUlr = {
    0: 'assets/restaurante-40.png',
    1: 'assets/carro-40.png',
    2: 'assets/mercado-40.png',
    3: 'assets/outros-40.png',
    4: 'assets/camping-40.png',
    5: 'assets/cafe-40.png',
  };

  List<Gasto> _gastos = [];
  List<Gasto> get gastos => _gastos;
  int get gastosCount => _gastos.length;
  final GastoDao _gastoDao = GastoDao();

  double get getValorGastoTotal {
    var soma = 0.0;
    for (int idx = 0; gastosCount > idx; idx++) {
      soma = soma + _gastos[idx].preco;
    }
    return soma;
  }

  void getGastosDaViagem() async {
    _gastos = await _gastoDao.findGastoByViagemId(idViagem);
    notifyListeners();
  }

  void saveGasto(Gasto gasto) async {
    final numberOfRowsSaved = await _gastoDao.save(gasto);
    if (numberOfRowsSaved > 0) {
      getGastosDaViagem();
    }
  }

  Future<int> deleteGasto(int id) async {
    int numberOfRowsDeleted = await _gastoDao.delete(id);
    if (numberOfRowsDeleted > 0) {
      getGastosDaViagem();
    }
    return numberOfRowsDeleted;
  }

  Future<int> updateGasto(Gasto gasto) async {
    int numberOfRowsUpdated = await _gastoDao.update(gasto);
    if (numberOfRowsUpdated > 0) {
      getGastosDaViagem();
    }
    return numberOfRowsUpdated;
  }
}
