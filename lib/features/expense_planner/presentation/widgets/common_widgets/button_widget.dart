// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_planner/features/expense_planner/presentation/widgets/common_widgets/app_ui_params.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final String buttonName;

  const ButtonWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.buttonColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            offset: Offset(-2, -2),
            color: Colors.white,
          ),
          BoxShadow(
            blurRadius: 2,
            offset: Offset(2, 2),
            color: Colors.white,
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
