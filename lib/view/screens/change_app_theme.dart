import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/theme_services.dart';
import '../widget/app_bar.dart';

class ChangeAppTheme extends StatelessWidget {
  ChangeAppTheme({Key? key}) : super(key: key);

  TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(title: "صانع التطبيقات", actions: [
          IconButton(
              onPressed: () {
                appThemeMode = appThemeMode == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark;
              },
              icon: Get.isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined)),
        ]),
        body: const Center(
            child: Column(
          children: [],
        )),
      ),
    );
  }
}
