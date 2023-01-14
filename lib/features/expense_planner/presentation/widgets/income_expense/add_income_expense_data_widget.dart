// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:expense_planner/features/expense_planner/presentation/bloc/common_bloc/common_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/income_expense/income_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_data/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/domain/entities/income_expense_type/income_expense_type_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/button_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/date_picker_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/dialog_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/drop_down_widget.dart';
import 'package:expense_planner/helper/constants.dart';

class AddIncomeExpenseDataWidget extends StatelessWidget {
  final int typeInt;

  final descriptionController = TextEditingController();
  final datePickerController = TextEditingController(text: AppGloable.selectedDate);
  final amountController = TextEditingController();

  String incomeTypeId = '';
  String selectedIncomeType = '';
  AddIncomeExpenseDataWidget({
    Key? key,
    required this.typeInt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<IncomeExpenseTypeEntity> typeList = [];
    return Card(
      elevation: 5,
      color: typeInt == isIncome ? AppColor.gradientColor01 : AppColor.gradientColor02,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(typeInt == isIncome ? 'Add Income Detail' : 'Add Expense Detail',
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height: 10),
            BlocBuilder<IncomeExpenseBloc, IncomeExpenseState>(
              builder: (context, state) {
                List<IncomeExpenseTypeEntity> typeList = [];
                typeList =
                    state.typeList.where((element) => element.isIncomeType == typeInt).toList();
                return BlocBuilder<CommonBloc, CommonState>(
                  builder: (context, state) {
                    return DropDwonWidget(
                      isYearMonth: false,
                      isExpanded: true,
                      items: typeList,
                      value: incomeTypeId.isNotEmpty ? incomeTypeId : null,
                      onChanged: (value) {
                        context
                            .read<CommonBloc>()
                            .add(SelectIncomeExpenseType(incomeExpenseType: value.toString()));
                        incomeTypeId = value.toString();
                        selectedIncomeType = typeList
                            .firstWhere((element) => element.id == value.toString())
                            .typeName;
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Description', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<CommonBloc, CommonState>(
              builder: (context, state) {
                return DatePickerWidget(datePickerController: datePickerController);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Amount', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (datePickerController.text.trim().isEmpty ||
                          amountController.text.trim().isEmpty ||
                          incomeTypeId.trim().isEmpty) {
                        DialogWidget.showDialogBox(
                          context,
                          Colors.amber,
                          false,
                          'Warning',
                          'All fields are required ?',
                        );
                      } else {
                        saveIncomeExpenseData(context);
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
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void saveIncomeExpenseData(BuildContext context) {
    final id = const Uuid().v1();
    final description =
        descriptionController.text.isNotEmpty ? descriptionController.text : selectedIncomeType;
    final incomeExpenseTypeId = incomeTypeId;
    final addDate = datePickerController.text;
    final amount = amountController.text;
    final isIncome = typeInt;

    final data = IncomeExpenseDataEntity(
      id: id,
      description: description,
      incomeExpenseTypeId: incomeExpenseTypeId,
      addDate: addDate,
      amount: amount,
      isIncome: isIncome,
    );

    // print(data);

    context.read<IncomeExpenseBloc>().add(AddIncomeExpenseData(incomeExpenseDataEntity: data));
    descriptionController.clear();
    // datePickerController.clear();
    amountController.clear();
    Navigator.pop(context);
  }

  // void updateIncomeData(BuildContext context) {
  //   final id = incomeDataEntity!.id;
  //   final description = descriptionController.text;
  //   final incomeId = incomeTypeId;
  //   final addDate = datePickerController.text;
  //   final amount = amountController.text;

  //   final data = IncomeExpenseDataEntity(
  //     id: id,
  //     description: description,
  //     incomeTypeId: incomeId,
  //     addDate: addDate,
  //     amount: amount,
  //     isIncome: isIncome,
  //   );

  //   context
  //       .read<IncomeExpenseDataBloc>()
  //       .add(UpdateIncomeExpenseDataEvent(incomeExpenseDataEntity: data));
  //   descriptionController.clear();
  //   incomeTypeId = '';
  //   selectedIncomeType = '';
  //   datePickerController.clear();
  //   amountController.clear();
  //   Navigator.pop(context);
  // }
}

// BlocBuilder<IncomeTypeBloc, IncomeTypeState>(
//               builder: (context, state) {
//                 List<IncomeTypeEntity> dataList = [];
//                 if (state is IncomeTypeInitialState) {
//                   context.read<IncomeTypeBloc>().add(FetchIncomeTypeEvent());
//                 } else if (state is LoadedState) {
//                   dataList = state.incomeTypeDataList;
//                   return BlocBuilder<CommonBloc, CommonState>(
//                     builder: (context, state) {
//                       return DropDwonWidget(
//                         isYearMonth: false,
//                         isExpanded: true,
//                         items: dataList,
//                         value: selectedIncomeType.isNotEmpty ? selectedIncomeType : null,
//                         onChanged: (value) {
//                           context
//                               .read<CommonBloc>()
//                               .add(SelectExpenseTypeEvent(expenseType: value));
//                           selectedIncomeType = value.toString();
//                         },
//                       );
//                     },
//                   );
//                 }
//                 return Container();
//               },
//             ),
