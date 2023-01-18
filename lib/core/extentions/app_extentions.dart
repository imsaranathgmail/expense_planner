import 'package:expense_planner/features/expense_planner/presentation/app_localization/app_localization.dart';
import 'package:flutter/cupertino.dart';

extension StringExtention on String {
  String t(BuildContext context) {
    return AppLocalization.of(context).translate(this) ?? '';
  }
}
