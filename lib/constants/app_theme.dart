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
          statusBarBrightness: Brightness.dark,
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
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          systemNavigationBarColor: Colors.black,
          // For Android
          statusBarIconBrightness: Brightness.dark,
          // For iOS.
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey.shade600,
        selectedItemColor: Colors.white,
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
