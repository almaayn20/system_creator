import 'package:flutter/material.dart';

Form formCustom({required final formKey, required final List<Widget> widgets}) {
  return Form(
    key: formKey,
    child: Column(
      children: widgets,
    ),
  );
}


// // الاستدعاء
// formCustom(formKey: _formKey, widgets: listOfWidgets),


// // static ملاحظة كل الادوات والدوال لابد ان تكون 


// // Key
// static final _formKey = GlobalKey<FormState>();


// //  List of widget
// final List<Widget> listOfWidgets = [
//   textFormFieldCustom(validate: validate,controller: controller,  label: "lael", hint: "hint",obscure: false, kbtype: TextInputType.text,),
//           Padding(padding: EdgeInsets.all(10.0)),
//           textFormFieldCustom(validate: validate,controller: controller2,  label: "label", hint: "hint",obscure: true, kbtype: TextInputType.number,),
//           Padding(padding: EdgeInsets.all(10.0)),
//           textFormFieldCustom(validate: validate,controller: controller3,  label: "label", hint: "hint",obscure: true, kbtype: TextInputType.number,),
//           Padding(padding: EdgeInsets.all(10.0)),
//           elevatedButtonCustom(func: anyFunction, text: "submit"),
//   ];



// // دالة التحقق من حقول النص
// static String? validate(value) {
// if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
// }

// // عند ضغط الزر
// static anyFunction() {
//                   // اذا تم التحقق 
//                 if (_formKey.currentState!.validate()) {
//                    // اكتب الكود هنا
//                 }
// }


