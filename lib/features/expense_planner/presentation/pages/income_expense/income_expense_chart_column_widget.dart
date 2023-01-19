import 'package:flutter/material.dart';

import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/income_expense/income_expense_data_grid_chart_widget.dart';

class IncomeExpenseChartColumnWidget extends StatelessWidget {
  final List<MapEntry<String, double>> incomeDataMap;
  final double totalIncome;
  final int isIncomeCat;
  const IncomeExpenseChartColumnWidget({
    Key? key,
    required this.incomeDataMap,
    required this.totalIncome,
    required this.isIncomeCat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 15,
      height: (MediaQuery.of(context).size.height - AppSizes.appBarHeight - 65),
      child: SingleChildScrollView(
        child: Column(
          children: [
            IncomeExpenseDataGridChartWidget(
              isIncomeCat: isIncomeCat,
              filteredMap: incomeDataMap,
              totalIncome: double.parse(
                totalIncome.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
