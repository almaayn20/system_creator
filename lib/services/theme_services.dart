import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeMode appThemeMode = ThemeMode.system;

ThemeData lightTheme = ThemeData(
//    brightness: Brightness.light,
  useMaterial3: true,
  colorSchemeSeed: Colors.green,
  textTheme: GoogleFonts.cairoTextTheme(),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorSchemeSeed: Colors.red,
  textTheme: GoogleFonts.cairoTextTheme(),
);
