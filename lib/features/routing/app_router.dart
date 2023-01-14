import 'package:expense_planner/features/expense_planner/presentation/pages/currency/currency_type_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/dashboard.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/income_expense/income_expense_data_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/income_expense/income_expense_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/pages/income_expense/income_expense_type_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case DashboardScreen.id:
        return MaterialPageRoute(builder: (context) => const DashboardScreen());
      case IncomeExpenseScreen.id:
        return MaterialPageRoute(builder: (context) => IncomeExpenseScreen());
      case IncomeExpenseTypeScreen.id:
        return MaterialPageRoute(builder: (context) => const IncomeExpenseTypeScreen());
      case IncomeExpenseDataScreen.id:
        return MaterialPageRoute(
            builder: (context) => const IncomeExpenseDataScreen(), settings: routeSettings);
      case CurrencyTypeScreen.id:
        return MaterialPageRoute(builder: (context) => const CurrencyTypeScreen());
    }
    return null;
  }
}
