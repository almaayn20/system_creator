import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/screens/compaines.dart';
import 'package:system_creator/view/screens/company_features.dart';
import 'package:system_creator/view/screens/create_company_third_screen.dart';
import 'package:system_creator/view/screens/settings.dart';
import 'package:system_creator/view/screens/login.dart';
import 'package:system_creator/view/screens/signup.dart';
import 'package:system_creator/view/screens/new_password.dart';
import 'package:system_creator/view/screens/verification.dart';
import 'package:system_creator/view/screens/create_company_first_screen.dart';
import 'package:system_creator/view/screens/create_company_second_screen.dart';
import 'package:tuple/tuple.dart';

import 'services/theme_Services.dart';
import 'view/widget/tap_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Settings();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeServices().theme,
      home: Login(),
    );
  }
}
