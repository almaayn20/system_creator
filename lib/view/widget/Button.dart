// EButton("Button",anyFunction),
// EButtonIcon("Button",anyFunction,Icons.add),

// void anyFunction() {
//   print("Hello");
// }

ElevatedButton EButton(text, func) {
  return ElevatedButton(
    onPressed: func,
    child: Text(text),
  );
}

 ElevatedButton EButtonIcon(text,func,icon) {
    return ElevatedButton.icon(
        onPressed: func,
        icon: Icon(icon),
        label: Text(text),
    );
}
