import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/screens/settings.dart';
import 'package:system_creator/view/screens/test_screen.dart';

import 'services/theme_Services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeServices().theme,
      home: Settings(),
    );
  }
}
