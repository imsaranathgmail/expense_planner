// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';

class ListMapFunctions {
  ListMapFunctions._();

  static double getTotalAmountFromList(List<IncomeExpenseDataEntity> incomeDataList) {
    return incomeDataList.fold(
        0.0, (previousValue, element) => previousValue += double.parse(element.amount));
  }

  static List<IncomeExpenseDataEntity> getFilteredListYearMonthWice(
      List<IncomeExpenseDataEntity> dataList, String searchString, int isIncomeData) {
    return dataList
        .where((element) =>
            (element.isIncome == isIncomeData && element.addDate.contains(searchString)))
        .toList();
  }

  static Map<String, double> getIncomeOrExpenseGroupWiceAmountMap(
      List<IncomeExpenseDataEntity> filterList) {
    return filterList.groupFoldBy<String, double>(
        (element) => element.incomeExpenseTypeId,
        (previous, element) => (previous != null
            ? previous += int.parse(element.amount)
            : double.parse(element.amount)));
  }
}
