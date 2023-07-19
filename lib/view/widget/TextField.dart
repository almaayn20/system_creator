// TField("Outlined","hint text","supporting text","error text",Icons.search,Icons.close,false,TextInputType.text),




TextEditingController controller = TextEditingController();

TextField TField(label,hint,helper,error,prefix,suffix,obscure,kbtype) {
  return  TextField(
    decoration: InputDecoration(
      prefixIcon:  Icon(prefix),
      suffixIcon: Icon(suffix),
      labelText: label,
      hintText: hint,
      helperText: helper,
      errorText: error,
      border:  OutlineInputBorder(),
    ),
    obscureText: obscure,
    keyboardType: kbtype,
    controller: controller,
  );
}
