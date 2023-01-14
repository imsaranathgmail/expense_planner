import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';

abstract class IncomeExpenseDataRepository {
  Future<List<IncomeExpenseDataEntity>> fetchIncomeExpenseData();
  // Future<List<Map<String, dynamic>>> customeFetchQueryData(String sql);
  Future<bool> saveIncomeExpenseData(IncomeExpenseDataEntity incomeExpenseDataEntity);
  Future<bool> updateIncomeExpenseData(IncomeExpenseDataEntity incomeExpenseDataEntity);
  Future<bool> deleteIncomeExpenseData(IncomeExpenseDataEntity incomeExpenseDataEntity);
}
