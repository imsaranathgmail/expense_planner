import 'package:expense_planner/features/expense_planner/presentation/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/drop_down_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/drawer/drawer_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/bloc/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/add_income_expense_data_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/income_expense_data_grid_chart_widget.dart';
import 'package:expense_planner/helper/common_function.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenseScreen extends StatelessWidget {
  static const id = 'IncomeScreen';
  const IncomeExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedYear = yearList[0];
    String selectedMonth = monthList[0];

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CommonBloc, CommonState>(
              builder: (context, state) {
                return DropDwonWidget(
                  isYearMonth: true,
                  isExpanded: false,
                  items: yearList,
                  value: selectedYear,
                  onChanged: (value) {
                    context.read<CommonBloc>().add(SelectYear(selectedYear: selectedYear));
                    selectedYear = value.toString();
                  },
                );
              },
            ),
            const SizedBox(width: 20),
            BlocBuilder<CommonBloc, CommonState>(
              builder: (context, state) {
                return DropDwonWidget(
                  isYearMonth: true,
                  isExpanded: false,
                  items: monthList,
                  value: selectedMonth,
                  onChanged: (value) {
                    context.read<CommonBloc>().add(SelectMonth(selectedMonth: selectedMonth));
                    selectedMonth = value.toString();
                  },
                );
              },
            ),
          ],
        ),
        actions: [
          ModelBottomSheetWidget(
            childWidget: AddIncomeExpenseDataWidget(
              typeInt: isIncome,
            ),
            icon: const Icon(Icons.add_box),
            iconColor: Colors.greenAccent,
          ),
          ModelBottomSheetWidget(
            childWidget: AddIncomeExpenseDataWidget(
              typeInt: isExpense,
            ),
            icon: const Icon(Icons.add_box),
            iconColor: Colors.redAccent,
          ),
        ],
        iconTheme: const IconThemeData(color: AppColor.appBarIconThemeColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColor.gradientColor01,
              AppColor.gradientColor02,
            ],
          ),
        ),
        child: BlocBuilder<IncomeExpenseBloc, IncomeExpenseState>(
          builder: (context, state) {
            double totalIncome = 0.0;
            double totalExpense = 0.0;
            final incomeDataList =
                state.dataList.where((element) => element.isIncome == isIncome).toList();
            totalIncome = incomeDataList.fold(
                0.0, (previousValue, element) => previousValue += double.parse(element.amount));
            final incomeDataMap =
                getIncomeOrExpenseGroupWiceAmountMap(incomeDataList).entries.toList();

            final expenseDataList =
                state.dataList.where((element) => element.isIncome == isExpense).toList();
            totalExpense = expenseDataList.fold(
                0.0, (previousValue, element) => previousValue += double.parse(element.amount));
            final expenseDataMap =
                getIncomeOrExpenseGroupWiceAmountMap(expenseDataList).entries.toList();

            return Padding(
              padding: EdgeInsets.only(top: AppSizes.appBarHeight, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Income Summery',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('Rs $totalIncome',
                                style: const TextStyle(fontSize: 15, color: Colors.white)),
                            const SizedBox(height: 10),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Expense Summery',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('Rs $totalExpense',
                                style: const TextStyle(fontSize: 15, color: Colors.white)),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 15,
                          height: (MediaQuery.of(context).size.height - AppSizes.appBarHeight - 65),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                IncomeExpenseDataGridChartWidget(
                                  isIncomeCat: isIncome,
                                  filteredMap: incomeDataMap,
                                  totalIncome: double.parse(
                                    totalIncome.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) - 15,
                          height: (MediaQuery.of(context).size.height - AppSizes.appBarHeight - 65),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                IncomeExpenseDataGridChartWidget(
                                  isIncomeCat: isExpense,
                                  filteredMap: expenseDataMap,
                                  totalIncome: double.parse(
                                    totalExpense.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // IncomeExpenseDataGridChartWidget(
                    //   filteredMap: incomeDataMap,
                    //   totalIncome: double.parse(
                    //     totalIncome.toString(),
                    //   ),
                    // ),
                    // IncomeExpenseDataGridChartWidget(
                    //   filteredMap: expenseDataMap,
                    //   totalIncome: double.parse(
                    //     totalExpense.toString(),
                    //   ),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
