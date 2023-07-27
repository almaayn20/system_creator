import 'package:flutter/material.dart';

ElevatedButton elevatedButtonIconCustom(
    Function() func, String text, IconData icon) {
  return ElevatedButton.icon(
    onPressed: func,
    icon: Icon(icon),
    label: Text(text),
  );
}
