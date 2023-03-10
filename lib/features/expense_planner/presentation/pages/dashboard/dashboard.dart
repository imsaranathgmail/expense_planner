import 'package:expense_planner/core/extentions/app_extentions.dart';
import 'package:expense_planner/core/helper/di/injection_container.dart';
import 'package:expense_planner/core/language/language_constants.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/currency/currency_type_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/language/language_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/glass_effect_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/model_bottom_sheet_widget.dart';

import 'package:expense_planner/features/expense_planner/presentation/pages/dashboard/dashboard_summery.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/dashboard/last_transaction_list_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/drawer/drawer_widget.dart';

import 'package:expense_planner/features/expense_planner/presentation/widgets/income_expense/add_income_expense_data_widget.dart';
import 'package:expense_planner/core/constants/app_constants.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/income_expense/income_expense_dashboard_bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  // static const id = 'DashboardScreen';

  const DashboardScreen({Key? key}) : super(key: key);
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String currSymb = '';
  late LanguageBloc languageBloc;
  @override
  void initState() {
    BlocProvider.of<IncomeExpenseBloc>(context).add(FetchBothTypeAndData());
    BlocProvider.of<CurrencyTypeBloc>(context).add(FetchCurrency());
    languageBloc = sl<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    languageBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    // final currList = context.select((CurrencyTypeBloc bloc) => bloc.state).currencyList;
    // currSymb = currList.isNotEmpty ? currList.first.currencySymbol : '';
    // CurrencySymbol.setCurrencySymbol(currSymb);
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
            children: [
              const GlassEffectWidget(height: 150, child: DashboardSummery()),
              const SizedBox(height: 10),
              Text(LanguageConstants.last7DaySummary.t(context),
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 10),
              const IncomeExpenseDashboardBarChartWidget(),
              Text(LanguageConstants.lastTransaction.t(context),
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 10),
              const LastTransactionListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
