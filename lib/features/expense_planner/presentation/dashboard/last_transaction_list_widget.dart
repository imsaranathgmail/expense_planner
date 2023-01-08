import 'package:expense_planner/features/expense_planner/presentation/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:expense_planner/helper/common_function.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastTransactionListWidget extends StatelessWidget {
  const LastTransactionListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<IncomeExpenseBloc, IncomeExpenseState>(
        builder: (context, state) {
          final dataList = state.dataList.reversed.toList();
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final dataEntity = dataList[index];
              return Card(
                elevation: 5,
                color: AppColor.gradientColor01,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.monetization_on,
                    size: 50,
                    color: dataEntity.isIncome == isIncome ? Colors.green : Colors.red,
                  ),
                  title: Text(dataEntity.description,
                      style: const TextStyle(fontSize: 20, color: Colors.white)),
                  subtitle: Text('${CurrencySymbol().currencySymbol} ${dataEntity.amount}',
                      style: const TextStyle(fontSize: 20, color: Colors.white)),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          dataEntity.isIncome == isIncome
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          size: 35,
                          color: dataEntity.isIncome == isIncome
                              ? Colors.greenAccent
                              : Colors.redAccent,
                        ),
                        Text(dataEntity.addDate,
                            style: const TextStyle(fontSize: 10, color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
