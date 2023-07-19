// AppBr("title",Icons.account_circle,anyFunction),


// void anyFunction() {
//   print("Hello");
// }



AppBar AppBr(title,icon,func) {
  return AppBar(
    title:  Text(title),
    leading:  BackButton(),
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: func,
      ),
    ],
    centerTitle: true,
  );
}
