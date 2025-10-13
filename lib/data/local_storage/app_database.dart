// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:travel_money_app/data/local_storage/dao/gasto_dao.dart';
import 'package:travel_money_app/data/local_storage/dao/viagem_dao.dart';

Future<Database> getDatabase(String sqlTable) async {
  final io.Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  String dbPath = join(appDocumentsDir.path, "travel_money.db");

  return await openDatabase(
    dbPath,
    version: 7,
    onCreate: (db, version) async {
      await db.execute(viagemTable);
      await db.execute(gastoTable);
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      await db.execute('DROP TABLE IF EXISTS viagem');
      await db.execute('DROP TABLE IF EXISTS gasto');
      await db.execute(viagemTable);
      await db.execute(gastoTable);
    },
  );
}
