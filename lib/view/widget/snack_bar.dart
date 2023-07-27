// SBar("This is a snackbar","Close",anyFunction),

// void anyFunction() {
//   print("Hello");
// }

import 'package:flutter/material.dart';

SnackBar snackBar(content, lable, func) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(content),
    action: SnackBarAction(
      label: lable,
      onPressed: func,
    ),
  );
}
