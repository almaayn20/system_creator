// AppBr(IconBtn(),"title",Icons.account_circle,anyFunction),
// Or
// AppBr(BackButton(),"title",Icons.account_circle,anyFunction),


// void anyFunction() {
//   print("Hello");
// }


// IconButton IconBtn() {
//   return IconButton(
//     icon: Icon(Icons.settings_outlined),
//     onPressed: anyFunction,
//   );
// }




AppBar AppBr(button,title,icon,func) {
  return AppBar(
    title:  Text(title),
    leading:  button,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: func,
      ),
    ],
    centerTitle: true,
  );
}
