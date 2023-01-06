// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ModelBottomSheetWidget extends StatelessWidget {
  final Widget childWidget;
  final Icon icon;
  final Color iconColor;

  const ModelBottomSheetWidget({
    Key? key,
    required this.childWidget,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: childWidget,
        ),
      ),
      icon: icon,
      color: iconColor,
    );
  }
}
