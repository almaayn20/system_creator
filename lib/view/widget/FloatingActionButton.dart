// floatingActionButton: FAButton("add new",Icons.add,anyFunction),


// void anyFunction() {
//   print("Hello");
// }


FloatingActionButton FAButton(text,icon,func) {
  return FloatingActionButton.extended(
    onPressed: func,
    icon: Icon(icon),
    label: Text(text),
  );
}
