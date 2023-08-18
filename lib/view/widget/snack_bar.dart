import 'package:flutter/material.dart';

void snackBarCustom(
  BuildContext context,
  String content,
  String actionLabel,
  Function() actionFun,
) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(content),
    action: SnackBarAction(
      label: actionLabel,
      onPressed: actionFun,
    ),
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
