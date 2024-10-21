import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff0C97B5);
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const String fontFamilyLato = "Lato";
  static const String fontFamilyQuick = "Quicksand";

  TextStyle stylish1(double size, Color color, {bool isBold = false}) {
  return GoogleFonts.raleway(
    fontSize: size,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    color: color,
  );
}
TextStyle stylish2(double size, Color color, {bool isBold = false}) {
  return GoogleFonts.comfortaa(
    fontSize: size,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
    color: color,
  );
}

static ThemeData lightTheme = ThemeData (
  brightness: Brightness.light,
  useMaterial3: true,
  primaryColor: primaryColor,
  fontFamily: fontFamilyQuick
);
static ThemeData darkTheme = ThemeData (
  brightness: Brightness.dark,
  useMaterial3: true,
  primaryColor: primaryColor,
  fontFamily: fontFamilyQuick
);

}