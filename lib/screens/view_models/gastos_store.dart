import 'package:flutter/material.dart';

import 'package:travel_money_app/data/local_storage/dao/gasto_dao.dart';
import 'package:travel_money_app/domain/models/gasto.dart';
import 'package:travel_money_app/domain/models/viagem.dart';

class GastosStore with ChangeNotifier {
  Viagem viagemSendoExibida;
  GastosStore({
    required this.viagemSendoExibida,
  });

  List<Gasto> _gastos = [];
  List<Gasto> get gastos => _gastos;
  int get gastosCount => _gastos.length;
  final GastoDao _gastoDao = GastoDao();

  void getGastosDaViagem() async {
    _gastos = await _gastoDao.findGastoByViagemId(viagemSendoExibida.idViagem!);
    notifyListeners();
  }

  void saveViagens(Gasto gasto) async {
    final numberOfRowsSaved = await _gastoDao.save(gasto);
    if (numberOfRowsSaved > 0) {
      getGastosDaViagem();
    }
  }

  Future<int> deleteViagem(int id) async {
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
