import 'package:expense_planner/helper/constants.dart';
import 'package:expense_planner/util/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class CurrencyTypeDBHelper {
  static Future<int> insert(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    return db.insert(
      CURRENCY_TYPE_TABLE,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await DBHelper.database();
    return db.query(CURRENCY_TYPE_TABLE);
  }

  static Future<int> update(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    return db.update(CURRENCY_TYPE_TABLE, data, where: 'id=?', whereArgs: [data['id']]);
  }

  static Future<int> delete(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    return db.delete(CURRENCY_TYPE_TABLE, where: 'id=?', whereArgs: [data['id']]);
  }
}
