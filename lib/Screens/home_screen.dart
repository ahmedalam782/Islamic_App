import 'package:flutter/material.dart';
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
          items: const [
            BottomNavigationBarItem(
              label: 'Quran',
              icon: ImageIcon(
                AssetImage("assets/images/icon_quran.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Hadiths',
              icon: ImageIcon(
                AssetImage("assets/images/icon_hadith.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Altasbih',
              icon: ImageIcon(
                AssetImage("assets/images/icon_sebha.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Radio',
              icon: ImageIcon(
                AssetImage("assets/images/icon_radio.png"),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(
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
