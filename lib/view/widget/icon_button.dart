import 'package:flutter/material.dart';

IconButton iconButtonCustom({
  required Function() func,required IconData icon}) {
  return IconButton(
    onPressed: func,
    icon: Icon(icon),
  );
}
