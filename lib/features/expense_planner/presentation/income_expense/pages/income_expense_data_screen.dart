// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/bloc/income_expense_bloc.dart';
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
            childWidget: AddIncomeExpenseDataWidget(typeInt: isIncomeCat),
            icon: const Icon(Icons.add_box),
            iconColor: isIncomeCat == isIncome ? Colors.greenAccent : Colors.redAccent,
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
            List<IncomeExpenseDataEntity> dataList = state.dataList;

            if (dataList.isNotEmpty) {
              dataList =
                  dataList.where((element) => element.incomeExpenseTypeId == typeData[0]).toList();

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
                    Text('Rs $total', style: const TextStyle(fontSize: 20, color: Colors.white)),
                    const SizedBox(height: 10),
                    IncomeExpenseDataListWidget(filterdList: dataList),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
