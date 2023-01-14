import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';

abstract class IncomeExpenseTypeRepository {
  Future<List<IncomeExpenseTypeEntity>> fetchIncomeExpenseType();
  Future<bool> saveIncomeExpenseType(IncomeExpenseTypeEntity incomeTypeEntity);
  Future<bool> updateIncomeExpenseType(IncomeExpenseTypeEntity incomeTypeEntity);
  Future<bool> deleteIncomeExpenseType(IncomeExpenseTypeEntity incomeTypeEntity);
}
