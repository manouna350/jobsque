import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_palette.dart';

class CustomThemes {
  static ThemeData lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppTheme.primaryColor,
      ),
      iconTheme: const IconThemeData(
        color: AppTheme.borderColor,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: AppTheme.buttonColor),
      scaffoldBackgroundColor: AppTheme.primaryColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppTheme.primaryColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          unselectedItemColor: AppTheme.sentence,
          selectedItemColor: AppTheme.buttonColor,
          enableFeedback: true,
          unselectedLabelStyle: TextStyle(fontSize: 12),
          showSelectedLabels: true,
          unselectedIconTheme:
              IconThemeData(color: AppTheme.sentence, weight: 5, size: 35),
          selectedLabelStyle: TextStyle(fontSize: 12),
          elevation: 0,
          backgroundColor: AppTheme.primaryColor,
          showUnselectedLabels: true,
          selectedIconTheme:
              IconThemeData(color: AppTheme.buttonColor, size: 35, weight: 5)));
}
