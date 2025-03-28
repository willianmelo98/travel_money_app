import 'package:flutter/material.dart';
import 'package:travel_money_app/data/local_storage/dao/viagem_dao.dart';
import 'package:travel_money_app/domain/models/viagem.dart';

class ViagensStore with ChangeNotifier {
  List<Viagem> _viagens = [];
  List<Viagem> get viagens => _viagens;
  int get viagensCount => _viagens.length;
  final ViagemDao _viagemDao = ViagemDao();

  void getViagens() async {
    _viagens = await _viagemDao.findAll();
    notifyListeners();
  }

  void saveViagens(Viagem viagem) async {
    final numberOfRowsSaved = await _viagemDao.save(viagem);
    if (numberOfRowsSaved > 0) {
      viagem.idViagem = numberOfRowsSaved;
      getViagens();
    }
  }

  Future<int> deleteViagem(int id) async {
    int numberOfRowsDeleted = await _viagemDao.delete(id);
    if (numberOfRowsDeleted > 0) {
      getViagens();
    }
    return numberOfRowsDeleted;
  }

  Future<int> updateViagem(Viagem viagem) async {
    int numberOfRowsUpdated = await _viagemDao.update(viagem);
    if (numberOfRowsUpdated > 0) {
      getViagens();
    }
    return numberOfRowsUpdated;
  }
}
