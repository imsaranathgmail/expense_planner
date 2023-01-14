import 'package:expense_planner/features/expense_planner/data/models/income_expense_data/income_expense_data_model.dart';
import 'package:expense_planner/util/income_expense_data_db_helper.dart';

abstract class IncomeExpenseDatasource {
  Future<List<IncomeExpenseDataModel>> fetchIncomeExpenseData();
  Future<List<Map<String, dynamic>>> customeFetchQueryData(String sql);
  Future<bool> saveIncomeExpenseData(IncomeExpenseDataModel incomeExpenseDataModel);
  Future<bool> updateIncomeExpenseData(IncomeExpenseDataModel incomeExpenseDataModel);
  Future<bool> deleteIncomeExpenseData(IncomeExpenseDataModel incomeExpenseDataModel);
}

class IncomeExpenseDatasourceImpl implements IncomeExpenseDatasource {
  @override
  Future<List<IncomeExpenseDataModel>> fetchIncomeExpenseData() async {
    final incomeExpenseDataList = await IncomeExpenseDataDBHelper.fetchData();
    // print(incomeExpenseDataList);
    final result =
        incomeExpenseDataList.map((type) => IncomeExpenseDataModel.fromMap(type)).toList();
    // print(result);
    return result;
  }

  @override
  Future<List<Map<String, dynamic>>> customeFetchQueryData(String sql) async {
    final dataList = await IncomeExpenseDataDBHelper.customeFetchQueryData(sql);
    return dataList;
  }

  @override
  Future<bool> saveIncomeExpenseData(IncomeExpenseDataModel incomeExpenseDataModel) async {
    final dataList = incomeExpenseDataModel.toMapToDb();
    final result = await IncomeExpenseDataDBHelper.insert(dataList);
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> updateIncomeExpenseData(IncomeExpenseDataModel incomeExpenseDataModel) async {
    final result = await IncomeExpenseDataDBHelper.update(incomeExpenseDataModel.toMap());
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteIncomeExpenseData(IncomeExpenseDataModel incomeExpenseDataModel) async {
    final result = await IncomeExpenseDataDBHelper.delete(incomeExpenseDataModel.toMap());
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }
}
