// floatingActionButton: FAButton("add new",Icons.add,anyFunction),

// void anyFunction() {
//   print("Hello");
// }

import 'package:flutter/material.dart';

FloatingActionButton faButton(text, icon, func) {
  return FloatingActionButton.extended(
    onPressed: func,
    icon: Icon(icon),
    label: Text(text),
  );
}
