import 'dart:developer';

import 'package:proj2_bmi/model/bmiModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DbHelper {
  static DbHelper dbHelper = DbHelper();
  DbHelper() {
    initDatabase();
  }

  static const String tableName = 'bmi_table';
  static const String userIdColumName = 'id';
  static const String userHeightColumName = 'height';
  static const String userWeightColumName = 'weight';
  static const String userBmiStatusColumName = 'bmiStatus';
  static const String userBmiScoreColumName = 'bmiScore';
  static const String userBmiColorColumName = 'BmiColor';
  static const String userBmiDateColumName = 'BmiDate';
  Database? database;
  initDatabase() async {
    database = await createConnectionWithDatabase();
  }

  Future<Database> createConnectionWithDatabase() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'bmis.db';
    String fullPath = join(databasePath, databaseName);
    Database database =
    await openDatabase(fullPath, version: 1, onCreate: (db, i) {
      log('hello, the database has been created');

      db.execute('''
 CREATE TABLE $tableName (
  $userIdColumName INTEGER PRIMARY KEY AUTOINCREMENT,
   $userHeightColumName TEXT,
    $userWeightColumName TEXT,
    $userBmiStatusColumName TEXT,
    $userBmiScoreColumName INTEGER,
    $userBmiColorColumName TEXT,
    $userBmiDateColumName TEXT,
    )
''');
    },
    //     onOpen: (db) async {
    //   final tables =
    //   await db.rawQuery('SELECT name FROM sqlite_master ORDER BY name;');
    //   log(tables.toString());
    // }
    );
    return database;
  }
  insertNewBmi(BmiModel bmiModel) async {
    int rowIndex = await database!.insert(tableName, bmiModel.toMap());
    log(rowIndex.toString());
  }

  Future<List<BmiModel>> selectAllHistory() async {
    List<Map<String, Object?>> rowsAsMaps = await database!.query(tableName);
    List<BmiModel> bmis =
    rowsAsMaps.map((e) => BmiModel.fromMap(e)).toList();
    return bmis;
  }


  updateOneTask(BmiModel bmiModel) async {
    int count = await database!.update(tableName, bmiModel.toMap(),
        where: '$userIdColumName=?', whereArgs: [bmiModel.id]);
    log(count.toString());
  }

}
