// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/add_income_expense_data_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/income_expense_data_list_widget.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expense_planner/features/expense_planner/presentation/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/drop_down_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/drawer/drawer_widget.dart';

class IncomeExpenseDataScreen extends StatelessWidget {
  static const id = 'IncomeDetialsScreen';
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
            final commonState = context.select((CommonBloc bloc) => bloc.state);
            final selectYear = commonState.selectedYear;
            final selectMonth = commonState.selectedMonth;

            // List<IncomeExpenseDataEntity> dataList = [];

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

            final total = dataList.fold(
                0.0, (previousValue, element) => previousValue += double.parse(element.amount));

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
          },
        ),
      ),
    );
  }
}
