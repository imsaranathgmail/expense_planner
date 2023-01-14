// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/presentation/bloc/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/message_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/income_expense/income_expense_data_list_widget.dart';
import 'package:expense_planner/core/helper/common_function.dart';
import 'package:expense_planner/core/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/drop_down_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/drawer/drawer_widget.dart';

class IncomeExpenseDataScreen extends StatelessWidget {
  // static const id = 'IncomeExpenseDataScreen';
  const IncomeExpenseDataScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeData = ModalRoute.of(context)!.settings.arguments as List;
    int isIncomeCat = typeData[3];

    List<String> monthListData = ['Month'];
    String selectedYear = yearList[0];
    String selectedMonth = monthListData[0];

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
                  value: state.selectedYear.isNotEmpty ? state.selectedYear : selectedYear,
                  onChanged: (value) {
                    BlocProvider.of<CommonBloc>(context)
                        .add(SelectYear(selectedYear: value.toString()));

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
        // actions: [
        //   ModelBottomSheetWidget(
        //     childWidget: AddIncomeExpenseDataWidget(typeInt: isIncomeCat),
        //     icon: const Icon(Icons.add_box),
        //     iconColor: isIncomeCat == isIncome ? Colors.greenAccent : Colors.redAccent,
        //   ),
        // ],
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

              final dataList = state.dataList
                  .where((element) => (element.incomeExpenseTypeId == typeData[0] &&
                      element.addDate.contains(searchString)))
                  .toList();

              final total = Functions().getTotalAmountFromList(dataList);

              return Padding(
                padding: EdgeInsets.only(top: AppSizes.appBarHeight, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${isIncomeCat == isIncome ? 'Income' : 'Expense'} - ${typeData[2]}',
                        style: const TextStyle(
                            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('${CurrencySymbol().currencySymbol} $total',
                        style: const TextStyle(fontSize: 20, color: Colors.white)),
                    const SizedBox(height: 10),
                    IncomeExpenseDataListWidget(filterdList: dataList),
                  ],
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
