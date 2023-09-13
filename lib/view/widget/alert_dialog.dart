import 'package:flutter/material.dart';

void alertDialogCustom(
    {required BuildContext context,
    required String title,
    required Widget content,
    required List<Widget> actions,
    IconData? icon}) {
  showDialog<void>(
    context: context,
    builder: (context) => Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        icon: icon != null ? Icon(icon) : null,
        title: Text(title),
        content: content,
        actions: actions,
      ),
    ),
  );
}
