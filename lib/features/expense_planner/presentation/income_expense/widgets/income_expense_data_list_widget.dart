// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:expense_planner/features/expense_planner/presentation/income_expense/bloc/bloc/income_expense_bloc.dart';
import 'package:expense_planner/helper/constants.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/features/expense_planner/domain/income_expense_data/entities/income_expense_data_entity.dart';
import 'package:expense_planner/features/expense_planner/presentation/common_widgets/const.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomeExpenseDataListWidget extends StatelessWidget {
  List<IncomeExpenseDataEntity> filterdList;
  IncomeExpenseDataListWidget({
    Key? key,
    required this.filterdList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: filterdList.length,
        itemBuilder: (context, index) {
          final dataEntity = filterdList[index];
          return Card(
            elevation: 5,
            color: (dataEntity.isIncome == isIncome)
                ? AppColor.gradientColor01
                : AppColor.gradientColor02,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.monetization_on,
                  size: 50,
                  color: (dataEntity.isIncome == isIncome) ? Colors.green : Colors.redAccent),
              title: Text(dataEntity.description,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dataEntity.amount,
                      style: const TextStyle(fontSize: 18, color: Colors.white)),
                  Text(dataEntity.addDate,
                      style: const TextStyle(fontSize: 12, color: Colors.white)),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<IncomeExpenseBloc>()
                            .add(DeleteIncomeExpenseData(incomeExpenseDataEntity: dataEntity));
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
