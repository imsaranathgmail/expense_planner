import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/glass_effect_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/currency/bloc/currency_type_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/dashboard/dashboard_summery.dart';
import 'package:expense_planner/features/expense_planner/presentation/dashboard/last_transaction_list_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/drawer/drawer_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/add_income_expense_data_widget.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  static const id = 'DashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    BlocProvider.of<IncomeExpenseBloc>(context).add(FetchBothTypeAndData());
    BlocProvider.of<CurrencyTypeBloc>(context).add(FetchCurrency());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.appBarIconThemeColor),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: Padding(
          padding: EdgeInsets.only(top: AppSizes.appBarHeight, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GlassEffectWidget(height: 150, child: DashboardSummery()),
              SizedBox(height: 10),
              Text('Last Transactions', style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(height: 10),
              LastTransactionListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
