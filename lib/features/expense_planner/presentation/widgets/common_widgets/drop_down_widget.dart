// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';

class DropDwonWidget extends StatelessWidget {
  final List items;
  final dynamic value;
  final ValueChanged onChanged;
  final bool isExpanded;
  final bool isYearMonth;

  DropDwonWidget({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    required this.isExpanded,
    required this.isYearMonth,
  }) : super(key: key);

  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: isExpanded,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      dropdownColor: AppColor.gradientColor01,
      iconSize: 45,
      hint: isYearMonth
          ? null
          : const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Select Type', style: TextStyle(color: Colors.white)),
            ),
      value: value,
      onChanged: onChanged,
      items: isYearMonth
          ? items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(item),
                ),
              );
            }).toList()
          : items.map((item) {
              return DropdownMenuItem(
                value: item.id,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(item.typeName),
                ),
              );
            }).toList(),
    );
  }
}
