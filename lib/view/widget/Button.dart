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
    style: filled == true
        ? ButtonStyle(
            textStyle: MaterialStateProperty.all(
                TextStyle(color: ColorScheme.fromSwatch().onSurface)),
            backgroundColor:
                MaterialStateProperty.all(ColorScheme.fromSwatch().primary),
          )
        : null,
    child: Text(
      text,
      style: filled == true
          ? TextStyle(color: ColorScheme.fromSwatch().onSecondary)
          : null,
    ),
  );
}
