// EButton("Button",anyFunction),
// EButtonIcon("Button",anyFunction,Icons.add),

// void anyFunction() {
//   print("Hello");
// }

import 'package:flutter/material.dart';

ElevatedButton elevatedButton(Function() func, String text) {
  return ElevatedButton(
    onPressed: func,
    child: Text(text),
  );
}

ElevatedButton elevatedButtonIcon(Function() func, String text, IconData icon) {
  return ElevatedButton.icon(
    onPressed: func,
    icon: Icon(icon),
    label: Text(text),
  );
}
