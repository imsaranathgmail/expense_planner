// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  DBHelper._();
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'expense_planner.db'), onCreate: (db, version) {
      db.execute('PRAGMA foreign_keys = ON');
      db.execute('''CREATE TABLE income_expense_type (
	                    id	TEXT,
	                    typeName	TEXT,
	                    isIncomeType	INTEGER,
	                    PRIMARY KEY(id)
            )''');

      db.execute('''CREATE TABLE income_expense_data (
	                    id	TEXT PRIMARY KEY,
	                    description	TEXT,
	                    addDate	TEXT,
	                    amount	TEXT,
	                    isIncome	INTEGER,
	                    incomeExpenseTypeId	TEXT,
	                  FOREIGN KEY(incomeExpenseTypeId) REFERENCES income_expense_type(id)

            )''');
      db.execute(
          'create table currency_type(id TEXT PRIMARY KEY,currencyName TEXT,currencySymbol TEXT)');
    }, version: 1);
  }
}
