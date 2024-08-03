import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app_route/Widgets/Tabs/Quran_Tab/widgets/alayat_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/Quran_tab_image.png",
          height: MediaQuery.sizeOf(context).height * .26,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .02,
        ),
        const Divider(
          height: 0,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.sizeOf(context).height * .01),
                  child: Text(
                    AppLocalizations.of(context)!.surahName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              const VerticalDivider(
                width: 0,
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.numberOfVerses,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
        const AlayatList(),
      ],
    );
  }
}
