import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app_route/Screens/home_screen.dart';
import 'package:islamic_app_route/Shared/Themes/app_themes.dart';
import 'package:islamic_app_route/Widgets/Tabs/Quran_Tab/Surah_details/surah_details.dart';

import 'Widgets/Tabs/Hadiths_Tab/Hadith_details/hadith_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const IslamicApp());
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SurahDetails.routeName: (_) => SurahDetails(),
        HadithDetails.routeName: (_) => HadithDetails(),
      },
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
