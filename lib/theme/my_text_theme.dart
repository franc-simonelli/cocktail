import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  ThemeData myTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: Colors.blueGrey,
      useMaterial3: true,
    ).copyWith(
      textTheme: GoogleFonts.eagleLakeTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 24.sp,
              ),
              titleMedium: TextStyle(
                fontSize: 20.sp,
              ),
              titleSmall: TextStyle(
                fontSize: 16.sp,
              ),
              labelLarge: TextStyle(
                fontSize: 14.sp,
              ),
              labelMedium: TextStyle(
                fontSize: 12.sp,
              ),
              labelSmall: TextStyle(
                fontSize: 10.sp,
              ),
            ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            40,
          ),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        elevation: 0,
      ),
    );
  }
}
