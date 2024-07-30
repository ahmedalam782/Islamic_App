import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/Tabs/Settings_Tab/settings_provider.dart';

class DefaultBackgroundImage extends StatelessWidget {
  const DefaultBackgroundImage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(settingsProvider.defaultBackground),
        ),
      ),
      child: child,
    );
  }
}
