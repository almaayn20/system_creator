import 'package:flutter/material.dart';

FilledButton customFilledButton(Function() onPressed, String text) {
  return FilledButton(onPressed: onPressed, child: Text(text));
}
