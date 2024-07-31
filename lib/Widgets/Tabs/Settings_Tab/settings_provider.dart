import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String lang = 'en';
  late BuildContext context;

  bool get isDark => themeMode == ThemeMode.dark;

  String get defaultBackground =>
      "assets/images/${isDark ? 'dark_bg' : 'default_bg'}.png";

  String get bodySeb7a =>
      "assets/images/${isDark ? 'body of seb7a_dark' : 'body of seb7a'}.png";

  String get headSeb7a =>
      "assets/images/${isDark ? 'head of seb7a_dark' : 'head of seb7a'}.png";

  double get topPaddingBodyOfSeb7a => isDark
      ? MediaQuery.sizeOf(context).height * 0.095
      : MediaQuery.sizeOf(context).height * 0.044;

  double get bottomPaddingBodyOfSeb7a => isDark
      ? MediaQuery.sizeOf(context).height * 0.04
      : MediaQuery.sizeOf(context).height * 0.01;

  void changeThemeMode(ThemeMode selectedThemeMode) {
    themeMode = selectedThemeMode;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    lang = selectedLanguage;
    notifyListeners();
  }
}
