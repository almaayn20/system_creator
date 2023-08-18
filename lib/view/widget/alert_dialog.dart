// طريقة الاستدعاء
// alertDialog(icon:Icons.add,title: Text('What is a dialog?'),text: Text('A dialog is a type of modal window '),action:listOfWidgets),


// static ملاحظة: جميع الدوال المستخدمة لابد ان تكون 
// final List<Widget>? listOfWidgets = [
//   textButtonCustom(func: anyFunction,text: "text"),
//   textButtonCustom(func: anyFunction,text: "text"),
//   ];

import 'package:flutter/material.dart';

AlertDialog alertDialog({ IconData? icon,  Text? title, Text? text,required final List<Widget>? action}) {
  return AlertDialog(
    icon: Icon(icon),
    title: title,
    content: text,
    actions: action ,
  );
}


