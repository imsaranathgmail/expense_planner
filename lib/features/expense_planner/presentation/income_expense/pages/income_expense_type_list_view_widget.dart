// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:expense_planner/features/expense_planner/presentation/common_widgets/app_ui_params.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/dialog_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/model_bottom_sheet_widget.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/income_expense_bloc.dart';
import 'package:expense_planner/features/expense_planner/presentation/income_expense/widgets/add_income_expense_type_widget.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/features/expense_planner/domain/income_expense_type/entities/income_expense_type_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenseListViewWidget extends StatelessWidget {
  List<IncomeExpenseTypeEntity> dataList;
  int type;
  IncomeExpenseListViewWidget({
    Key? key,
    required this.dataList,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final isIncomeType = dataList[index].isIncomeType == type ? true : false;
          if (isIncomeType) {
            return Card(
              elevation: 5,
              color: type == 1 ? AppColor.gradientColor01 : AppColor.gradientColor02,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.read_more,
                  size: 40,
                  color: type == 1 ? Colors.green : Colors.red,
                ),
                title: Text(dataList[index].typeName,
                    style: const TextStyle(fontSize: 18, color: Colors.white)),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 40,
                      child: Row(
                        children: [
                          ModelBottomSheetWidget(
                            childWidget: AddIncomeExpenseTypeWidget(
                              incomeExpenseTypeEntity: dataList[index],
                              isIncomeType: true,
                            ),
                            icon: const Icon(Icons.edit),
                            iconColor: Colors.green,
                          ),
                          GestureDetector(
                            onTap: () async {
                              final result = DialogWidget.showDialogBox(
                                context,
                                const Color.fromARGB(255, 165, 14, 3),
                                true,
                                'Warning',
                                'Ary you sure ? all income detail will be deleted',
                              );
                              if (await result) {
                                _deleteSelected(dataList[index], context);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  void _deleteSelected(IncomeExpenseTypeEntity dataEntity, BuildContext context) {
    BlocProvider.of<IncomeExpenseBloc>(context)
        .add(DeleteIncomeExpenseType(incomeExpenseTypeEntity: dataEntity));
  }
}
