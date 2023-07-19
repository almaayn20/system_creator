// SBar("This is a snackbar","Close",anyFunction),

// void anyFunction() {
//   print("Hello");
// }



SnackBar SBar(content,lable,func) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(content),
    action: SnackBarAction(
      label: lable,
      onPressed: func,
    ),
  );
}
