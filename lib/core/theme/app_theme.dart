import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
    useMaterial3: true,
    primaryColor: Colors.red,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      primary: Colors.red,
      secondary: Colors.redAccent,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
