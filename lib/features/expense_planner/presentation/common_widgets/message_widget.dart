import 'package:expense_planner/features/expense_planner/presentation/common_widgets/glass_effect_widget.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  const MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassEffectWidget(
        child: SizedBox(
      height: 200,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            message,
            style: const TextStyle(fontSize: 35, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }
}
