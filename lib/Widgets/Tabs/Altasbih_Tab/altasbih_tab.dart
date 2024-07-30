import 'package:flutter/material.dart';
import 'package:islamic_app_route/Shared/Themes/app_themes.dart';
import 'package:provider/provider.dart';

import '../Settings_Tab/settings_provider.dart';

class AltasbihTab extends StatefulWidget {
  const AltasbihTab({super.key});

  @override
  State<AltasbihTab> createState() => _AltasbihTabState();
}

class _AltasbihTabState extends State<AltasbihTab> {
  int currentIndex = 0;
  int count = 0;
  double angle = 0;
  List<String> namesOfSebiha = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'ولا حول ولا قوة إلا بالله',
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .09,
                ),
                child: Image.asset(
                  settingsProvider.headSeb7a,
                  height: MediaQuery.of(context).size.height * .12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .003,
                ),
                child: GestureDetector(
                  onTap: () => changeCountSebihaAndRotate(),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      settingsProvider.bodySeb7a,
                      height: MediaQuery.of(context).size.height * .50,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .020,
          ),
          Center(
            child: Text(
              "Numbers Of Tasbeehs ",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            margin: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.sizeOf(context).height * .025,
              ),
              color: settingsProvider.isDark
                  ? AppThemes.darkPrimaryColor
                  : AppThemes.lightPrimaryColor.withOpacity(.57),
            ),
            child: Text(
              "$count",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            margin: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.sizeOf(context).height * .025,
              ),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Text(
              namesOfSebiha[currentIndex],
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: settingsProvider.isDark
                      ? AppThemes.blackColor
                      : AppThemes.whiteColor),
            ),
          ),
        ],
      ),
    );
  }

  void changeCountSebihaAndRotate() {
    count++;
    if (count % 33 == 0) {
      currentIndex++;
    }
    angle += 360 / 33;
    if (currentIndex == namesOfSebiha.length) {
      currentIndex = 0;
      count = 0;
      angle = 0;
    }
    setState(() {});
  }
}
