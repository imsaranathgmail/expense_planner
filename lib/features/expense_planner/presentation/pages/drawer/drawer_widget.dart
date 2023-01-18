// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expense_planner/core/extentions/app_extentions.dart';
import 'package:expense_planner/core/language/language_constants.dart';
import 'package:expense_planner/core/language/languages_list.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/language/language_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/glass_effect_widget.dart';
import 'package:expense_planner/features/routing/Routes.dart';

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
          DrawerHeader(
            child: GlassEffectWidget(
              child: Center(
                  child: Text(
                LanguageConstants.appName.t(context),
                style: const TextStyle(fontSize: AppFontSize.f25, color: Colors.white54),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(Routes.dashboardScreen),
              child: GlassEffectWidget(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    LanguageConstants.dashboard.t(context),
                    style: const TextStyle(
                        fontSize: AppFontSize.fD18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),
          Divider(thickness: 5, color: Colors.purple[600], indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(Routes.incomeExpenseScreen),
              child: GlassEffectWidget(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    LanguageConstants.incomeExpense.t(context),
                    style: const TextStyle(
                        fontSize: AppFontSize.fD18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),

          Divider(thickness: 5, color: Colors.purple[600], indent: 20, endIndent: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(Routes.incomeExpenseTypeScreen),
              child: GlassEffectWidget(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    LanguageConstants.incomeExpenseTypes.t(context),
                    style: const TextStyle(
                        fontSize: AppFontSize.fD18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(Routes.currencyTypeScreen),
              child: GlassEffectWidget(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    LanguageConstants.manageCurrencyTypes.t(context),
                    style: const TextStyle(
                        fontSize: AppFontSize.fD18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.drawerTextColor),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: GlassEffectWidget(
              child: ExpansionTile(
                title: Text(
                  LanguageConstants.language.t(context),
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: AppFontSize.fD18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  for (int i = 0; i < LanguagesList.languages.length; i++)
                    ListTile(
                      title: Text(LanguagesList.languages[i].value),
                      onTap: () => BlocProvider.of<LanguageBloc>(context)
                          .add(ToggledLanguageEvent(languageEntity: LanguagesList.languages[i])),
                    )
                ],
              ),
            ),
          ),
          // const Text('Expense Planner'),
        ],
      ),
    );
  }
}
