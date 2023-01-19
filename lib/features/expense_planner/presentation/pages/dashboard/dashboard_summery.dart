import 'package:expense_planner/core/extentions/app_extentions.dart';
import 'package:expense_planner/core/helper/functions/currency_symbol_holder.dart';
import 'package:expense_planner/core/language/language_constants.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';

import 'package:expense_planner/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardSummery extends StatelessWidget {
  const DashboardSummery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeExpenseBloc, IncomeExpenseState>(
      builder: (context, state) {
        final incomeDataList =
            state.dataList.where((element) => element.isIncome == isIncome).toList();
        final expenseDataList =
            state.dataList.where((element) => element.isIncome == isExpense).toList();
        double totalIncome = 0.0;
        double totalExpense = 0.0;
        double myBalance = 0.0;

        totalIncome = incomeDataList.fold(
            0.0, (previousValue, element) => previousValue += double.parse(element.amount));
        totalExpense = expenseDataList.fold(
            0.0, (previousValue, element) => previousValue += double.parse(element.amount));

        myBalance = totalIncome - totalExpense;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(LanguageConstants.myBalance.t(context),
                  style: const TextStyle(fontSize: 25, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('${CurrencySymbolHolder.currencySymbol} $myBalance',
                  style: const TextStyle(fontSize: 35, color: Colors.white)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        LanguageConstants.income.t(context),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '${CurrencySymbolHolder.currencySymbol} $totalIncome',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        LanguageConstants.expense.t(context),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('${CurrencySymbolHolder.currencySymbol} $totalExpense',
                          style: const TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
