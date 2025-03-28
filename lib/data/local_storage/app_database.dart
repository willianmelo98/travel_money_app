import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase(String sqlTable) async {
  final io.Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  String dbPath = join(appDocumentsDir.path, "travel_money.db");

  return openDatabase(
    dbPath,
    onCreate: (db, version) {
      db.execute(sqlTable);
    },
    version: 1,
  );
}
