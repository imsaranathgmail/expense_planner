import 'package:expense_planner/core/extentions/app_extentions.dart';
import 'package:expense_planner/core/helper/functions/date_function.dart';
import 'package:expense_planner/core/language/language_constants.dart';
import 'package:expense_planner/features/expense_planner/presentation/bloc/common_bloc/common_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    Key? key,
    required this.datePickerController,
  }) : super(key: key);

  final TextEditingController datePickerController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: datePickerController,
      readOnly: true,
      onTap: () {
        DatePicker.showDatePicker(
          context,
          currentTime: DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now())),
          showTitleActions: true,
          minTime: DateTime(2022, 01, 01),
          maxTime: DateTime(2100, 01, 01),
          onConfirm: (time) {
            final selectedDate = DatesFunction.dateConvertor(time);
            context.read<CommonBloc>().add(SelecteDate(selectedDate: selectedDate));
            datePickerController.text = selectedDate;
          },
          onCancel: () {},
        );
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(LanguageConstants.date.t(context), style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
