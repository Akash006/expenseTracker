import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  Database? myDB;

  Future<Database> getDB() async {
    myDB ??= await openDB();
    return myDB!;

    // if (myDB != null) {
    //   return myDB!;
    // } else {
    //   myDB = await openDB();
    //   return myDB!;
    // }
  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "tracker.db");

    return await openDatabase(dbPath, onCreate: (db, version) {
      // DB Tables
      db.execute(
          "CREATE TABLE category_table (category_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon_name INTEGER, icon_family TEXT, ledger_name TEXT)");
    }, version: 1);
  }

  Future<List<Map<String, dynamic>>> getCategoryDB() async {
    var db = await getDB();
    List<Map<String, dynamic>> mdata = await db.query("category_table");
    return mdata;
  }

  Future<bool> insertCategoryDB({
    required categoryName,
    required categoryIconName,
    required categoryFamily,
    categoryLedgerName = "default",
  }) async {
    var db = await getDB();
    int rowEffected = await db.insert("category_table", {
      "name": categoryName,
      "icon_name": categoryIconName,
      "icon_family": categoryFamily,
      "ledger_name": categoryLedgerName
    });

    return rowEffected > 0;
  }
}
