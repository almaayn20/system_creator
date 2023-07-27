import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/services/theme_services.dart';

import '../widget/app_bar.dart';
import '../widget/button_icon.dart';
import '../widget/text_field.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ChangeAppTheme extends StatefulWidget {
  ChangeAppTheme({Key? key}) : super(key: key);

  @override
  State<ChangeAppTheme> createState() => _ChangeAppThemeState();
}

class _ChangeAppThemeState extends State<ChangeAppTheme> {
  TextEditingController cont = TextEditingController();

  Color currentColor = Colors.blue;
  // Default color for the picker
  void changeColor(Color color) {
    setState(() {
      currentColor = color;
      changeColorSchemeSeed(color);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(title: 'صانع التطبيقات'),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.maxFinite - 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                textField(
                    controller: cont,
                    label: 'الإيميل',
                    hint: 'ادخل إيميلك',
                    //helper: 'Ent',
                    //   error: 'invalid email',
                    prefix: Icons.email_outlined,
                    // suffix: Icons.exit_to_app,
                    obscure: false,
                    kbtype: TextInputType.emailAddress),
                const SizedBox(
                  height: 20,
                ),
                textField(
                    controller: cont,
                    label: 'كلمة السر',
                    hint: 'ادخل كلمة السر',
                    //helper: 'Ent',
                    //   error: 'invalid email',
                    prefix: Icons.password_outlined,
                    // suffix: Icons.exit_to_app,
                    obscure: true,
                    kbtype: TextInputType.visiblePassword),
                const SizedBox(
                  height: 20,
                ),
                FilledButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.lock_clock_outlined),
                    label: const Text('Hello')),
                elevatedButtonIconCustom(() {
                  ThemeServices().switchTheme();
                }, 'الوضع الليلي', Icons.dark_mode_outlined),
                colorPickerCustom(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton colorPickerCustom(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('اختر لون'),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: currentColor,
                  onColorChanged: changeColor,
                  showLabel: true,
                  pickerAreaHeightPercent: 0.8,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ThemeServices().changeThemeData();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
      child: Text('Pick a color'),
    );
  }
}
