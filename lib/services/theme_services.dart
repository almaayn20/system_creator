import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeServices {
  final GetStorage _box = GetStorage();
  final _key = 'mode';

  _saveThemeToBox(int m) => _box.write(_key, m);
  int loadThemeFromBox() => _box.read<int>(_key) ?? 1;

  ThemeMode get theme => loadThemeFromBox() == 1
      ? ThemeMode.light
      : loadThemeFromBox() == 2
          ? ThemeMode.dark
          : ThemeMode.system;

  void changeTheme(int n, int m, BuildContext context) {
    _saveThemeToBox(n);
    _saveColorToBox(m);
    updateThemes(context);

    // Get.changeThemeMode(n == 1
    //     ? ThemeMode.light
    //     : n == 2
    //         ? ThemeMode.dark
    //         : ThemeMode.system);
  }

  final _key2 = 'color';

  _saveColorToBox(int m) => _box.write(_key2, m);
  int loadColorFromBox() => _box.read<int>(_key2) ?? 1;

  Color get c {
    if (loadColorFromBox() == 1)
      return const Color(0xff6750a4);
    else if (loadColorFromBox() == 2)
      return Colors.indigo;
    else if (loadColorFromBox() == 3)
      return Colors.blue;
    else if (loadColorFromBox() == 4)
      return Colors.teal;
    else if (loadColorFromBox() == 5)
      return Colors.green;
    else if (loadColorFromBox() == 6)
      return Colors.yellow;
    else if (loadColorFromBox() == 7)
      return Colors.orange;
    else if (loadColorFromBox() == 8)
      return Colors.deepOrange;
    else
      return Colors.pink;
  }

  void updateThemes(BuildContext context) {
    ThemeData lt = ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: c,
      fontFamily: 'Cairo',
    );

    ThemeData dt = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: c,
      fontFamily: 'Cairo',
    );

    ThemeData dlts = ThemeData(
      brightness: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? Brightness.dark
          : Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: c,
      fontFamily: 'Cairo',
    );

    loadThemeFromBox() == 1
        ? Get.changeTheme(lt)
        : loadThemeFromBox() == 2
            ? Get.changeTheme(dt)
            : Get.changeTheme(dlts);
  }
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: ThemeServices().c,
  fontFamily: 'Cairo',
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: ThemeServices().c,
  fontFamily: 'Cairo',
);
