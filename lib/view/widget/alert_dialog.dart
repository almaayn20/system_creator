import 'package:flutter/material.dart';

void alertDialogCustom(
    {required BuildContext context,
    required String title,
    required String text,
    required List<Widget> actions,
    IconData? icon}) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      icon: icon != null ? Icon(icon) : null,
      title: Text(title),
      content: Text(text),
      actions: actions,
    ),
  );
}
