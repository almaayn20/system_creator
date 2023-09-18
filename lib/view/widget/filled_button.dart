import 'package:flutter/material.dart';

FilledButton filledButtonCustom(
  {required Function() onPressed,required String text}) {
  return FilledButton(onPressed: onPressed, child: Text(text));
}
