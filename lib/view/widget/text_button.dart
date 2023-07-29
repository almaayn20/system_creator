// textButtonCustom(func: anyFunction,text: "text"),

import 'package:flutter/material.dart';

TextButton textButtonCustom({required Function() func,required String text}) {
  return TextButton(
    onPressed: func,
    child: Text(text),
  );
}
