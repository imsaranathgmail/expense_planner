import 'package:expense_planner/features/expense_planner/presentation/bloc/common_bloc/common_bloc.dart';
import 'package:expense_planner/helper/common_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

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
          currentTime: DateTime.now(),
          showTitleActions: true,
          minTime: DateTime(2022, 1, 1),
          maxTime: DateTime(2100, 1, 1),
          onConfirm: (time) {
            final selectedDate = Functions().dateConvertor(time);
            context.read<CommonBloc>().add(SelecteDate(selectedDate: selectedDate));
            datePickerController.text = selectedDate;
          },
          onCancel: () {},
        );
      },
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Date', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
