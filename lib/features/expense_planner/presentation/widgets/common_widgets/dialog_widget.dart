import 'package:flutter/material.dart';

class DialogWidget {
  static Future<bool> showDialogBox(
    BuildContext context,
    Color bgColor,
    bool isConfDialog,
    String title,
    String content,
  ) async {
    return await showDialog(
      context: context,
      builder: (context) {
        Widget cancelButton = TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        );
        Widget continueButton = TextButton(
          child: const Text("Continue"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        );
        return AlertDialog(
          backgroundColor: bgColor,
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            content,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: isConfDialog ? [cancelButton, continueButton] : [cancelButton],
        );
      },
    );
  }
}
