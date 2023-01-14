import 'package:expense_planner/features/expense_planner/presentation/pages/currency/currency_type_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/dashboard.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/pages/income_expense_data_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/pages/income_expense_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/pages/income_expense_type_screen.dart';
import 'package:expense_planner/features/routing/Routes.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.dashboardScreen:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      case Routes.incomeExpenseScreen:
        return MaterialPageRoute(builder: (context) => const IncomeExpenseScreen());
      case Routes.incomeExpenseTypeScreen:
        return MaterialPageRoute(builder: (context) => const IncomeExpenseTypeScreen());
      case Routes.incomeExpenseDataScreen:
        return MaterialPageRoute(
            builder: (context) => const IncomeExpenseDataScreen(), settings: routeSettings);
      case Routes.currencyTypeScreen:
        return MaterialPageRoute(builder: (context) => const CurrencyTypeScreen());
    }
    return null;
  }
}
