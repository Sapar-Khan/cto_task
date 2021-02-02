import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "dict.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      print('oncreate');
      await db.execute("CREATE TABLE city ("
          "id INTEGER PRIMARY KEY,"
          "country_id INTEGER,"
          "name TEXT,"
          "name_en TEXT,"
          "ord INTEGER,"
          "long REAL,"
          "lati REAL,"
          "radius INTEGER"
          ")");
    });
  }

  newCity(Map<String, dynamic> data) async {
    final db = await database;
    var raw = await db.rawInsert(
        'INSERT INTO city (id, country_id,name, name_en, ord, long, lati, radius)'
        'VALUES (?,?,?,?,?,?,?,?)',
        [
          data['id'],
          data['country_id'],
          data['name'],
          data['name_en'],
          data['ord'],
          data['location'][0],
          data['location'][1],
          data['radius']
        ]);
    return raw;
  }

  Future<Map<int, String>> getCities() async {
    final db = await database;
    Map<int, String> cities = new Map<int, String>();
    var res = await db.query('city');
    res.forEach((element) {
      cities[element['id']] = element['name'];
    });
    return cities;
  }
}
