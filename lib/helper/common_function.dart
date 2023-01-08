// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';

import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';

class Functions {
  static Functions? _instance;
  Functions._internal();

  factory Functions() {
    _instance ??= Functions._internal();
    return _instance!;
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
        .where((element) =>
            (element.isIncome == isIncomeData && element.addDate.contains(searchString)))
        .toList();
  }

  Map<String, double> getIncomeOrExpenseGroupWiceAmountMap(
      List<IncomeExpenseDataEntity> filterList) {
    return filterList.groupFoldBy<String, double>(
        (element) => element.incomeExpenseTypeId,
        (previous, element) => (previous != null
            ? previous += int.parse(element.amount)
            : double.parse(element.amount)));
  }
}

class CurrencySymbol {
  static CurrencySymbol? _instance;
  String? _symbol;

  CurrencySymbol._internal(this._symbol);

  factory CurrencySymbol() {
    _instance ??= CurrencySymbol._internal(null);
    return _instance!;
  }

  setCurrencySymbol(String symbol) {
    _symbol = symbol;
  }

  String get currencySymbol => _symbol!;
}
