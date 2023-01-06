// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_type/entities/income_expense_type_entity.dart';

class Service {
  static final Service _instance = Service._internal();
  factory Service(String value) => _instance;
  Service._internal() {
    currencySymbol = '';
  }

  String? currencySymbol;

  String get myVariable => currencySymbol!;
}

String dateConvertor(DateTime dateTime) {
  String selectedDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  return selectedDate;
}

List<IncomeExpenseDataEntity> filterIncomeOrExpenseData(
    List<IncomeExpenseDataEntity> dataList, int isIncome) {
  return dataList.where((element) => element.isIncome == isIncome).toList();
}

List<IncomeExpenseTypeEntity> filterIncomeOrExpenseType(
    List<IncomeExpenseTypeEntity> dataList, int isIncome) {
  return dataList.where((element) => element.isIncomeType == isIncome).toList();
}

double getTotalIncomeOrExpenseAmount(List<IncomeExpenseDataEntity> filterList) {
  return filterList.fold<double>(
      0.0, (previousValue, element) => previousValue + double.parse(element.amount));
}

Map<String, double> getIncomeOrExpenseGroupWiceAmountMap(List<IncomeExpenseDataEntity> filterList) {
  return filterList.groupFoldBy<String, double>(
      (element) => element.incomeExpenseTypeId,
      (previous, element) => (previous != null
          ? previous += int.parse(element.amount)
          : double.parse(element.amount)));
}
