import 'package:flutter/material.dart';

import '../../../Shared/network/local/cache_helper.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  String lang = "en";

  bool get isDark => themeMode == ThemeMode.dark;

  String get splashImage =>
      "assets/images/${isDark ? 'img_splash_dark' : 'img_splash'}.png";

  String get defaultBackground =>
      "assets/images/${isDark ? 'dark_bg' : 'default_bg'}.png";

  String get splashBackground =>
      "assets/images/${isDark ? 'bg_splash_dark' : 'bg_splash'}.png";

  String get bodySeb7a =>
      "assets/images/${isDark ? 'body of seb7a_dark' : 'body of seb7a'}.png";

  String get headSeb7a =>
      "assets/images/${isDark ? 'head of seb7a_dark' : 'head of seb7a'}.png";

  IconData get settingModeIcon => isDark ? Icons.dark_mode : Icons.light_mode;

  Future<void> changeThemeMode(ThemeMode selectedThemeMode) async {
    themeMode = selectedThemeMode;
    await CacheHelper.saveData(key: 'isDark', value: isDark);
    notifyListeners();
  }

  Future<void> changeLanguage(String selectedLanguage) async {
    lang = selectedLanguage;
    await CacheHelper.saveData(key: 'isLanguage', value: lang);
    notifyListeners();
  }
}
