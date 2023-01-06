// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/bloc/income_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:expense_planner/features/expense_planner/domain/income_expense_type/entities/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/button_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/dialog_widget.dart';
import 'package:expense_planner/helper/constants.dart';

class AddIncomeExpenseTypeWidget extends StatelessWidget {
  final IncomeExpenseTypeEntity? incomeExpenseTypeEntity;
  final bool isIncomeType;
  final controller = TextEditingController();
  AddIncomeExpenseTypeWidget({
    Key? key,
    this.incomeExpenseTypeEntity,
    required this.isIncomeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (incomeExpenseTypeEntity != null) {
      controller.text = incomeExpenseTypeEntity!.typeName;
    }
    return Card(
      elevation: 5,
      color: AppColor.gradientColor01,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          children: [
            incomeExpenseTypeEntity == null
                ? Text(isIncomeType ? 'Income Source' : 'Expense Source',
                    style: const TextStyle(fontSize: 20, color: Colors.white))
                : Text(isIncomeType ? 'Update Income Source' : 'Update Expense Source',
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Description', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.text.trim().isEmpty) {
                      DialogWidget.showDialogBox(
                        context,
                        Colors.amber,
                        false,
                        'Warning',
                        'Description Cant be empty?',
                      );
                    } else {
                      if (incomeExpenseTypeEntity == null) {
                        saveIncomeExpenseSource(context, isIncomeType);
                      } else {
                        updateIncomeExpenseSource(context);
                      }
                    }
                  },
                  child: const ButtonWidget(
                    height: 50,
                    width: 150,
                    buttonName: 'Save',
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const ButtonWidget(
                    height: 50,
                    width: 150,
                    buttonName: 'Cancel',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void saveIncomeExpenseSource(BuildContext context, bool isIncomeType) {
    final id = const Uuid().v1();
    final typeName = controller.text;
    final data = IncomeExpenseTypeEntity(
        id: id, typeName: typeName, isIncomeType: isIncomeType ? isIncome : isExpense);
    BlocProvider.of<IncomeExpenseBloc>(context)
        .add(AddIncomeExpenseType(incomeExpenseTypeEntity: data));
    controller.clear();
    Navigator.pop(context);
  }

  void updateIncomeExpenseSource(BuildContext context) {
    final id = incomeExpenseTypeEntity!.id;
    final typeName = controller.text;
    final data = IncomeExpenseTypeEntity(
        id: id, typeName: typeName, isIncomeType: incomeExpenseTypeEntity!.isIncomeType);
    BlocProvider.of<IncomeExpenseBloc>(context)
        .add(UpdateIncomeExpenseType(incomeExpenseTypeEntity: data));
    controller.clear();
    Navigator.pop(context);
  }
}
