// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_planner/core/extentions/app_extentions.dart';
import 'package:expense_planner/core/language/language_constants.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/currency/currency_type_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/dialog_widget.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/currency/currency_type_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/button_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddCurrencyTypeWidget extends StatelessWidget {
  final CurrencyTypeEntity? currencyTypeEntity;
  final nameController = TextEditingController();
  final symbolController = TextEditingController();
  AddCurrencyTypeWidget({
    Key? key,
    this.currencyTypeEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currencyTypeEntity != null) {
      nameController.text = currencyTypeEntity!.currencyName;
      symbolController.text = currencyTypeEntity!.currencySymbol;
    }
    return Card(
      elevation: 5,
      color: AppColor.gradientColor01,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          children: [
            Text(LanguageConstants.addCurrencyType.t(context),
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(LanguageConstants.currencyName.t(context),
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: symbolController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text(LanguageConstants.currencySymbol.t(context),
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (nameController.text.trim().isEmpty ||
                        symbolController.text.trim().isEmpty) {
                      DialogWidget.showDialogBox(
                        context,
                        Colors.amber,
                        true,
                        'Warning',
                        'Are you sure ?',
                      );
                    } else {
                      if (currencyTypeEntity != null) {
                        updateCurrencyType(context);
                      } else {
                        saveCurrencyType(context);
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

  void saveCurrencyType(BuildContext context) {
    final id = const Uuid().v1();
    final currencyName = nameController.text;
    final currencySymbol = symbolController.text;
    final data = CurrencyTypeEntity(
      id: id,
      currencyName: currencyName,
      currencySymbol: currencySymbol,
    );
    context.read<CurrencyTypeBloc>().add(AddCurrency(currencyTypeEntity: data));
    nameController.clear();
    symbolController.clear();
    Navigator.pop(context);
  }

  void updateCurrencyType(BuildContext context) {
    final id = currencyTypeEntity!.id;
    final currencyName = nameController.text;
    final currencySymbol = symbolController.text;
    final data = CurrencyTypeEntity(
      id: id,
      currencyName: currencyName,
      currencySymbol: currencySymbol,
    );
    context.read<CurrencyTypeBloc>().add(UpdateCurrency(currencyTypeEntity: data));
    nameController.clear();
    symbolController.clear();
    Navigator.pop(context);
  }
}
