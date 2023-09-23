import 'package:flutter/material.dart';

TextFormField textFormFieldCustom({
  required String? Function(dynamic value) validate,
  required TextEditingController controller,
  required String label,
  required String hint,
  String? helper,
  String? error,
  IconData? prefix,
  IconData? suffix,
  required bool obscure,
  TextInputType? kbtype,
  bool enabled = true,
  Function()? onTab,
  bool readonly = false,
}) {
  return TextFormField(
    decoration: InputDecoration(
      prefixIcon: Icon(prefix),
      suffixIcon: Icon(suffix),
      labelText: label,
      hintText: hint,
      helperText: helper,
      errorText: error,
      border: const OutlineInputBorder(),
      enabled: enabled,
    ),
    onTap: onTab,
    readOnly: readonly,
    validator: validate,
    obscureText: obscure,
    keyboardType: kbtype,
    controller: controller,
  );
}



// // الاستدعاء
// textFormFieldCustom(validate: validate,controller: controller,  label: "label", hint: "hint",obscure: false, kbtype: TextInputType.text,)



// //  validate دالة ال 

// static String? validate(value) {
// if (value == null || value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
// }
