import 'package:expense_planner/core/constants/app_constants.dart';
import 'package:expense_planner/core/helper/db_util/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class IncomeExpenseTypeDBHelper {
  static Future<int> insert(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    return db.insert(
      INCOME_EXPENSE_TYPE_TABLE,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> fetchData() async {
    final db = await DBHelper.database();
    return db.query(INCOME_EXPENSE_TYPE_TABLE, orderBy: 'isIncomeType DESC');
  }

  static Future<int> update(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    return db.update(INCOME_EXPENSE_TYPE_TABLE, data, where: 'id=?', whereArgs: [data['id']]);
  }

  static Future<int> delete(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    await db
        .delete(INCOME_EXPENSE_DATA_TABLE, where: 'incomeExpenseTypeId=?', whereArgs: [data['id']]);
    return db.delete(INCOME_EXPENSE_TYPE_TABLE, where: 'id=?', whereArgs: [data['id']]);
  }
}
