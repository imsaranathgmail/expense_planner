import 'package:expense_planner/features/expense_planner/data/models/income_expense_type/income_expense_type_model.dart';
import 'package:expense_planner/core/helper/db_util/income_expense_type_db_helper.dart';

abstract class IncomeExpenseTypeDatasource {
  Future<List<IncomeExpenseTypeModel>> fetchIncomeExpenseType();
  Future<bool> saveIncomeExpenseType(IncomeExpenseTypeModel incomeExpenseTypeModel);
  Future<bool> updateIncomeExpenseType(IncomeExpenseTypeModel incomeExpenseTypeModel);
  Future<bool> deleteIncomeExpenseType(IncomeExpenseTypeModel incomeExpenseTypeModel);
}

class IncomeTypeDatasourceImpl implements IncomeExpenseTypeDatasource {
  @override
  Future<List<IncomeExpenseTypeModel>> fetchIncomeExpenseType() async {
    final incomeExpenseTypeList = await IncomeExpenseTypeDBHelper.fetchData();
    final result =
        incomeExpenseTypeList.map((type) => IncomeExpenseTypeModel.fromMap(type)).toList();
    return result;
  }

  @override
  Future<bool> saveIncomeExpenseType(IncomeExpenseTypeModel incomeExpenseTypeModel) async {
    final dataList = incomeExpenseTypeModel.toMap();
    final result = await IncomeExpenseTypeDBHelper.insert(dataList);
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> updateIncomeExpenseType(IncomeExpenseTypeModel incomeExpenseTypeModel) async {
    final result = await IncomeExpenseTypeDBHelper.update(incomeExpenseTypeModel.toMap());
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> deleteIncomeExpenseType(IncomeExpenseTypeModel incomeExpenseTypeModel) async {
    final result = await IncomeExpenseTypeDBHelper.delete(incomeExpenseTypeModel.toMap());
    if (result > 0) {
      return true;
    } else {
      return false;
    }
  }
}
