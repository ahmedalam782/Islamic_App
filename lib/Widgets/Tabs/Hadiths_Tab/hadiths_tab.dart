import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app_route/Widgets/Tabs/Hadiths_Tab/widgets/hadiths_list.dart';

class HadithsTab extends StatelessWidget {
  const HadithsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/hadeth_logo.png",
          height: MediaQuery.sizeOf(context).height * .26,
        ),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.hadiths,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const Divider(),
        const HadithsList(),
      ],
    );
  }
}
