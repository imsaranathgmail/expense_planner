import 'package:expense_planner/features/expense_planner/presentation/currency/pages/currency_type_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/dashboard.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/glass_effect_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/pages/income_expense_screen.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/pages/income_expense_type_screen.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white.withOpacity(0.1),
      child: Column(
        children: [
          const DrawerHeader(
            child: GlassEffectWidget(
              child: Center(
                  child: Text(
                'E x p e n s e \n P l a n n e r',
                style: TextStyle(fontSize: AppFontSize.f25, color: Colors.white54),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(DashboardScreen.id),
              child: const GlassEffectWidget(
                child: Center(
                  child: Text(
                    'Dashboard',
                    style: TextStyle(fontSize: 20, color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),
          Divider(thickness: 5, color: Colors.purple[600], indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(IncomeExpenseScreen.id),
              child: const GlassEffectWidget(
                child: Center(
                  child: Text(
                    'Income / Expense ',
                    style: TextStyle(fontSize: 20, color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),

          Divider(thickness: 5, color: Colors.purple[600], indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(IncomeExpenseTypeScreen.id),
              child: const GlassEffectWidget(
                child: Center(
                  child: Text(
                    'Income / Expense Types',
                    style: TextStyle(fontSize: 20, color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(CurrencyTypeScreen.id),
              child: const GlassEffectWidget(
                child: Center(
                  child: Text(
                    'Manage Currency Type',
                    style: TextStyle(fontSize: 20, color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),
          // const Text('Expense Planner'),
        ],
      ),
    );
  }
}
