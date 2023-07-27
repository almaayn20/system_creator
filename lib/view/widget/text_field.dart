// TField("Outlined","hint text","supporting text","error text",Icons.search,Icons.close,false,TextInputType.text),

import 'package:flutter/material.dart';

TextField textField(
    {required TextEditingController controller,
    required String label,
    required String hint,
    String? helper,
    String? error,
    required IconData prefix,
    IconData? suffix,
    bool? obscure,
    required kbtype}) {
  return TextField(
    decoration: InputDecoration(
      prefixIcon: Icon(prefix),
      suffixIcon: Icon(suffix),
      labelText: label,
      hintText: hint,
      helperText: helper,
      errorText: error,
      border: const OutlineInputBorder(),
    ),
    obscureText: obscure!,
    keyboardType: kbtype,
    controller: controller,
  );
}
