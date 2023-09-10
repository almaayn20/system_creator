import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Color selectedColor = Colors.green;

void changeColorSchemeSeed(Color c) => selectedColor = c;

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool _loadThemeFromBox() => _box.read<bool>(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  void changeThemeData() {
    if (_loadThemeFromBox()) {
      Get.changeTheme(ThemeData(
        colorSchemeSeed: selectedColor,
        useMaterial3: true,
        //     textTheme: GoogleFonts.cairoTextTheme(),
        fontFamily: 'Cairo',
      ));
    } else {
      Get.changeTheme(ThemeData(
        //  brightness: Brightness.dark,
        useMaterial3: true,
        colorSchemeSeed: selectedColor,
        //   textTheme: GoogleFonts.cairoTextTheme(),
        fontFamily: 'Cairo',
      ));
    }
  }
}

ThemeData lightTheme = ThemeData(
//    brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: selectedColor,
//  textTheme: GoogleFonts.cairoTextTheme(),
  fontFamily: 'Cairo',
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: selectedColor,
  // textTheme: GoogleFonts.cairoTextTheme(),
  fontFamily: 'Cairo',
);
