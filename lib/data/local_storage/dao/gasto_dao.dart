import 'package:sqflite/sqlite_api.dart';

import '../../../domain/models/gasto.dart';
import '../app_database.dart';

class GastoDao {
  static const String _tableName = "gasto";
  static const String _idGasto = 'idGasto';
  static const String _idViagem = 'idViagem';
  static const String _lugar = 'lugar';
  static const String _dataGasto = 'dataGasto';
  static const String _categoria = 'categoria';
  static const String _tipoPagamento = 'tipoPagamento';
  static const String _descricao = 'descricao';
  static const String _preco = 'preco';

  static const String gastoTable = 'CREATE TABLE $_tableName('
      '$_idGasto INTEGER PRIMARY KEY, '
      '$_idViagem INTEGER, '
      '$_lugar TEXT, '
      '$_dataGasto TEXT, '
      '$_categoria TEXT, '
      '$_tipoPagamento TEXT, '
      '$_descricao TEXT, '
      '$_preco INTEGER)';

  Future<int> save(Gasto gasto) async {
    final Database database = await getDatabase(gastoTable);
    Map<String, dynamic> gastoMap = gasto.toJson();
    return database.insert(_tableName, gastoMap);
  }

  Future<List<Gasto>> findAll() async {
    final Database database = await getDatabase(gastoTable);
    final List<Map<String, dynamic>> gastosMap =
        await database.query(_tableName);
    List<Gasto> gastos = _toList(gastosMap);
    return gastos;
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase(gastoTable);
    return db.delete(
      _tableName,
      where: 'id = ?',
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
