// AppBr(IconBtn(),"title",Icons.account_circle,anyFunction),
// Or
// AppBr(BackButton(),"title",Icons.account_circle,anyFunction),

// void anyFunction() {
//   print("Hello");
// }

// IconButton IconBtn() {
//   return IconButton(
//     icon: Icon(Icons.settings_outlined),
//     onPressed: anyFunction,
//   );
// }

import 'package:flutter/material.dart';

AppBar appBarCustom({
  Widget? leading,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0,
    title: Text(title),
    leading: leading,
    actions: actions,
    centerTitle: true,
  );
}
