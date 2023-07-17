import 'package:flutter/material.dart';

class appbar extends IconButton {
  appbar(IconData icon, Function onTap)
      : super(
          icon: Icon(icon),
          onPressed: onTap as void Function()?,
          color: Colors.purple,
        );
}
