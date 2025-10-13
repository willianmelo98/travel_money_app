import 'package:sqflite/sqlite_api.dart';

import '../../../domain/models/gasto.dart';
import '../app_database.dart';

const String _tableName = "gasto";
const String _idGasto = 'idGasto';
const String _idViagem = 'idViagem';
const String _dataGasto = 'dataGasto';
const String _categoria = 'categoria';
const String _meioDePagamento = 'meioDePagamento';
const String _titleGasto = 'titleGasto';
const String _preco = 'preco';
const String gastoTable = 'CREATE TABLE $_tableName('
    '$_idGasto INTEGER PRIMARY KEY, '
    '$_idViagem INTEGER, '
    '$_dataGasto TEXT, '
    '$_categoria INTEGER, '
    '$_meioDePagamento INTEGER, '
    '$_titleGasto TEXT, '
    '$_preco REAL)';

class GastoDao {
  Future<int> save(Gasto gasto) async {
    final Database database = await getDatabase(gastoTable);
    Map<String, dynamic> gastoMap = gasto.toJson();
    return database.insert(_tableName, gastoMap);
  }

  Future<int> update(Gasto gasto) async {
    final Database db = await getDatabase(gastoTable);
    Map<String, dynamic> gastoMap = gasto.toJson();
    return db.update(
      _tableName,
      gastoMap,
      where: 'idGasto = ?',
      whereArgs: [gasto.idGasto],
    );
  }

  Future<List<Gasto>> findGastoByViagemId(int viagemID) async {
    final Database database = await getDatabase(gastoTable);
    final List<Map<String, dynamic>> gastosMap = await database.query(
      _tableName,
      where: 'idViagem = ?',
      whereArgs: [viagemID],
    );
    List<Gasto> gastos = _toList(gastosMap);
    return gastos;
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase(gastoTable);
    return db.delete(
      _tableName,
      where: 'idGasto = ?',
      whereArgs: [id],
    );
  }

  List<Gasto> _toList(List<Map<String, dynamic>> gastosMap) {
    final List<Gasto> gastos = [];
    for (Map<String, dynamic> mapGastos in gastosMap) {
      final Gasto gasto = Gasto.fromJson(mapGastos);
      gastos.add(gasto);
    }
    return gastos;
  }
}
