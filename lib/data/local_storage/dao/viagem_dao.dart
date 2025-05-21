import 'package:sqflite/sqlite_api.dart';
import 'package:travel_money_app/domain/models/viagem.dart';

import '../app_database.dart';

const String _tableName = "viagem";
const String _idViagem = 'idViagem';
const String _lugar = 'lugar';
const String _dataViagem = 'dataViagem';
const String _orcamento = 'orcamento';

const String viagemTable = 'CREATE TABLE $_tableName('
    '$_idViagem INTEGER PRIMARY KEY, '
    '$_lugar TEXT, '
    '$_dataViagem TEXT, '
    '$_orcamento REAL)';

class ViagemDao {
  Future<int> save(Viagem viagem) async {
    final Database database = await getDatabase(viagemTable);
    Map<String, dynamic> viagemMap = viagem.toJson();
    return database.insert(_tableName, viagemMap);
  }

  Future<List<Viagem>> findAll() async {
    final Database database = await getDatabase(viagemTable);
    final List<Map<String, dynamic>> viagensMap =
        await database.query(_tableName);
    List<Viagem> viagens = _toList(viagensMap);
    return viagens;
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase(viagemTable);
    return db.delete(
      _tableName,
      where: 'idViagem = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Viagem viagem) async {
    final Database db = await getDatabase(viagemTable);
    Map<String, dynamic> viagemMap = viagem.toJson();
    return db.update(
      _tableName,
      viagemMap,
      where: 'idViagem = ?',
      whereArgs: [viagem.idViagem],
    );
  }

  List<Viagem> _toList(List<Map<String, dynamic>> viagensMap) {
    final List<Viagem> viagens = [];
    for (Map<String, dynamic> mapViagem in viagensMap) {
      final Viagem viagem = Viagem.fromJson(mapViagem);
      viagens.add(viagem);
    }
    return viagens;
  }
}
