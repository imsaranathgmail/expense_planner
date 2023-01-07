import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardSummery extends StatelessWidget {
  const DashboardSummery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final state = BlocProvider.of<CurrencyTypeBloc>(context).state;
    // final entityr = state.currencyList;
    // final currSym = entityr.isEmpty ? '' : entityr.first.currencySymbol;
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
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('My Balance', style: TextStyle(fontSize: 25, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child:
                  Text('Rs $myBalance', style: const TextStyle(fontSize: 35, color: Colors.white)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Income',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Rs $totalIncome',
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
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Spend',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text('Rs $totalExpense',
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
