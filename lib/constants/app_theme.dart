import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          // For Android
          statusBarIconBrightness: Brightness.light,
          // For iOS.
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          // For Android
          statusBarIconBrightness: Brightness.dark,
          // For iOS.
          statusBarBrightness: Brightness.dark,
        ),
        centerTitle: true,
      ),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  toggleTheme(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
  }
}
