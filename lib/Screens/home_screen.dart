import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app_route/Shared/Components/default_appbar.dart';
import 'package:islamic_app_route/Shared/Components/default_background_image.dart';
import 'package:islamic_app_route/Widgets/Tabs/Altasbih_Tab/altasbih_tab.dart';
import 'package:islamic_app_route/Widgets/Tabs/Hadiths_Tab/hadiths_tab.dart';
import 'package:islamic_app_route/Widgets/Tabs/Quran_Tab/quran_tab.dart';
import 'package:islamic_app_route/Widgets/Tabs/Radio_Tab/radio_tab.dart';
import 'package:islamic_app_route/Widgets/Tabs/Settings_Tab/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithsTab(),
    AltasbihTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundImage(
      child: Scaffold(
        appBar: const DefaultAppbar(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.quran,
              icon: const ImageIcon(
                AssetImage("assets/images/icon_quran.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.hadiths,
              icon: const ImageIcon(
                AssetImage("assets/images/icon_hadith.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.altasbih,
              icon: const ImageIcon(
                AssetImage("assets/images/icon_sebha.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.radio,
              icon: const ImageIcon(
                AssetImage("assets/images/icon_radio.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.settings,
              icon: const Icon(
                Icons.settings_rounded,
              ),
            ),
          ],
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabs,
        ),
      ),
    );
  }
}
