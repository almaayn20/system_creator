// ADialog(Icons.add,'What is a dialog?','A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made.',"action1",anyFunction,"action2",anyFunction),


// void anyFunction() {
//   print("Hello");
// }



AlertDialog ADialog(icon,title,text,action1,func1,action2,func2) {
  return AlertDialog(
    icon: Icon(icon),
    title: Text(title),
    content: Text(text),
    actions: <Widget>[
      TextButton(
        child: Text(action1),
        onPressed: func1,
      ),
      TextButton(
        child: Text(action2),
        onPressed: func2,
      ),
    ],
  );
}
