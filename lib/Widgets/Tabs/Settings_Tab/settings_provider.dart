import 'package:flutter/material.dart';

import '../../../Shared/network/local/cache_helper.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = CacheHelper.getData(key: 'isDark') == null
      ? ThemeMode.light
      : CacheHelper.getData(key: 'isDark')
          ? ThemeMode.dark
          : ThemeMode.light;
  String lang = CacheHelper.getData(key: 'isLanguage') ?? "en";
  late BuildContext context;

  bool get isDark => themeMode == ThemeMode.dark;

  String get splashImage =>
      "assets/images/${isDark ? 'bg_splash_dark' : 'bg_splash'}.png";

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

  IconData get settingModeIcon => isDark ? Icons.dark_mode : Icons.light_mode;

  void changeThemeMode(ThemeMode selectedThemeMode) {
    themeMode = selectedThemeMode;
    CacheHelper.saveData(key: 'isDark', value: isDark);
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    lang = selectedLanguage;
    CacheHelper.saveData(key: 'isLanguage', value: lang);
    notifyListeners();
  }
}
