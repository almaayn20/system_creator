// EButton("Button",anyFunction),
// EButtonIcon("Button",anyFunction,Icons.add),

// void anyFunction() {
//   print("Hello");
// }

import 'package:flutter/material.dart';

ElevatedButton elevatedButtonCustom(
    {required Function() func, required String text, filled = false}) {
  return ElevatedButton(
    onPressed: func,
    child: Text(
      text,
    ),
  );
}
