// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_type/entities/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';

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

double getTotalAmountFromList(List<IncomeExpenseDataEntity> incomeDataList) {
  return incomeDataList.fold(
      0.0, (previousValue, element) => previousValue += double.parse(element.amount));
}

List<IncomeExpenseDataEntity> getFilteredListYearMonthWice(
    IncomeExpenseState state, String searchString, int isIncomeData) {
  return state.dataList
      .where(
          (element) => (element.isIncome == isIncomeData && element.addDate.contains(searchString)))
      .toList();
}

Map<String, double> getIncomeOrExpenseGroupWiceAmountMap(List<IncomeExpenseDataEntity> filterList) {
  return filterList.groupFoldBy<String, double>(
      (element) => element.incomeExpenseTypeId,
      (previous, element) => (previous != null
          ? previous += int.parse(element.amount)
          : double.parse(element.amount)));
}
