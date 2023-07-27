// EButton("Button",anyFunction),
// EButtonIcon("Button",anyFunction,Icons.add),

// void anyFunction() {
//   print("Hello");
// }

import 'package:flutter/material.dart';

ElevatedButton elevatedButtonCustom(Function() func, String text) {
  return ElevatedButton(
    onPressed: func,
    child: Text(text),
  );
}
