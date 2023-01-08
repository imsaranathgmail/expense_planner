import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/income_expense_type/entities/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/drop_down_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/message_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/drawer/drawer_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/pages/income_expense_chart_column_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/add_income_expense_data_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/income_expense_data_grid_chart_widget.dart';
import 'package:expense_planner/helper/common_function.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenseScreen extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _scaffoldSate = GlobalKey<ScaffoldState>();
  static const id = 'IncomeScreen';
  const IncomeExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> monthListData = ['Month'];
    String selectedYear = yearList[0];
    String selectedMonth = monthListData[0];

    return Scaffold(
      // key: _scaffoldSate,
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
                  value: state.selectedYear.isNotEmpty ? state.selectedYear : selectedYear,
                  onChanged: (value) {
                    BlocProvider.of<CommonBloc>(context)
                        .add(SelectYear(selectedYear: value.toString()));
                    monthListData = monthList;
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
                  items: monthListData,
                  value: state.selectedMonth.isNotEmpty ? state.selectedMonth : selectedMonth,
                  onChanged: (value) {
                    BlocProvider.of<CommonBloc>(context)
                        .add(SelectMonth(selectedMonth: value.toString()));
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
            if (state is IncomeExpenseDataLoaded) {
              final commonState = context.select((CommonBloc bloc) => bloc.state);

              final selectYear = commonState.selectedYear;
              final selectMonth = commonState.selectedMonth;

              String searchString = '';

              if (yearList.indexOf(selectYear) != 0 && selectYear.isNotEmpty) {
                searchString = '/$selectYear';
                if (monthList.indexOf(selectMonth) != 0 && selectMonth.isNotEmpty) {
                  searchString = '/${monthList.indexOf(selectMonth)}/$selectYear';
                } else {
                  searchString = '/$selectYear';
                }
              }

              List<IncomeExpenseDataEntity> incomeDataList =
                  Functions().getFilteredListYearMonthWice(state, searchString, isIncome);
              double totalIncome = Functions().getTotalAmountFromList(incomeDataList);
              List<MapEntry<String, double>> incomeDataMap =
                  Functions().getIncomeOrExpenseGroupWiceAmountMap(incomeDataList).entries.toList();

              List<IncomeExpenseDataEntity> expenseDataList =
                  Functions().getFilteredListYearMonthWice(state, searchString, isExpense);
              double totalExpense = Functions().getTotalAmountFromList(expenseDataList);
              List<MapEntry<String, double>> expenseDataMap = Functions()
                  .getIncomeOrExpenseGroupWiceAmountMap(expenseDataList)
                  .entries
                  .toList();

              return Padding(
                padding: EdgeInsets.only(top: AppSizes.appBarHeight, left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                            'Balance - ${CurrencySymbol().currencySymbol} ${totalIncome - totalExpense}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 10),
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
                              Text('${CurrencySymbol().currencySymbol} $totalIncome',
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
                              Text('${CurrencySymbol().currencySymbol} $totalExpense',
                                  style: const TextStyle(fontSize: 15, color: Colors.white)),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IncomeExpenseChartColumnWidget(
                            incomeDataMap: incomeDataMap,
                            totalIncome: totalIncome,
                          ),
                          const SizedBox(width: 10),
                          IncomeExpenseChartColumnWidget(
                            incomeDataMap: expenseDataMap,
                            totalIncome: totalExpense,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ErrorState) {
              return MessageWidget(message: state.message);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
