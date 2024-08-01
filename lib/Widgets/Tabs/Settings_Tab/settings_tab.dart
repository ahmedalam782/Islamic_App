import 'package:flutter/material.dart';
import 'package:islamic_app_route/Shared/Themes/app_themes.dart';
import 'package:islamic_app_route/Widgets/Tabs/Settings_Tab/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * .07,
        horizontal: MediaQuery.sizeOf(context).width * .04,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                settingsProvider.settingModeIcon,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .05,
              ),
              Text(
                "Dark Mode",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              Switch(
                value: settingsProvider.isDark,
                onChanged: (value) => settingsProvider.changeThemeMode(
                  value ? ThemeMode.dark : ThemeMode.light,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .05,
          ),
          Row(
            children: [
              Icon(
                Icons.language,
                color: Theme.of(context).secondaryHeaderColor,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .05,
              ),
              Text(
                "Language",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.sizeOf(context).height * .012,
                      horizontal: MediaQuery.sizeOf(context).width * .04,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).secondaryHeaderColor, // Add this
                    ),
                    value: settingsProvider.lang,
                    borderRadius: BorderRadius.circular(25),
                    dropdownColor: settingsProvider.isDark
                        ? AppThemes.darkPrimaryColor
                        : AppThemes.whiteColor,
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          'English',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text(
                          'Arabic',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )
                    ],
                    onChanged: (value) =>
                        settingsProvider.changeLanguage(value!),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
