// TField("Outlined","hint text","supporting text","error text",Icons.search,Icons.close,false,TextInputType.text),

import 'package:flutter/material.dart';

TextField textFieldCustom(
    {required TextEditingController controller,
    required String label,
    required String hint,
    String? helper,
    String? error,
    IconData? prefix,
    IconData? suffix,
    required bool obscure,
    required kbtype,
    Function()? onTap}) {
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
    onTap: onTap,
    obscureText: obscure,
    keyboardType: kbtype,
    controller: controller,
  );
}
