import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app_route/Screens/home_screen.dart';
import 'package:islamic_app_route/Screens/splash_screen.dart';
import 'package:islamic_app_route/Shared/Themes/app_themes.dart';
import 'package:islamic_app_route/Widgets/Tabs/Quran_Tab/Surah_details/surah_details.dart';
import 'package:islamic_app_route/Widgets/Tabs/Settings_Tab/settings_provider.dart';
import 'package:provider/provider.dart';

import 'Shared/network/local/cache_helper.dart';
import 'Widgets/Tabs/Hadiths_Tab/Hadith_details/hadith_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await CacheHelper.init();
  ThemeMode theme = await CacheHelper.getData(key: 'isDark') == null
      ? ThemeMode.light
      : CacheHelper.getData(key: 'isDark')
          ? ThemeMode.dark
          : ThemeMode.light;
  String lang = await CacheHelper.getData(key: 'isLanguage') ?? "en";

  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider()
        ..changeThemeMode(theme)
        ..changeLanguage(lang),
      child: const IslamicApp(),
    ),
  );
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SurahDetails.routeName: (_) => SurahDetails(),
        HadithDetails.routeName: (_) => HadithDetails(),
      },
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.lang),
    );
  }
}
