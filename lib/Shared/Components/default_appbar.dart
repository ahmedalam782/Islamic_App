import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../Widgets/Tabs/Settings_Tab/settings_provider.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: settingsProvider.lang == 'en'
            ? MediaQuery.of(context).size.width * .04
            : 0,
        start: settingsProvider.lang == 'ar'
            ? MediaQuery.of(context).size.width * .05
            : 0,
      ),
      child: AppBar(
        title: Text(
          AppLocalizations.of(context)!.islami,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
