import 'package:flutter/material.dart';
import 'package:islamic_app_route/Widgets/Tabs/Settings_Tab/settings_provider.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(settingsProvider.splashImage),
        ),
      ),
    );
  }
}
