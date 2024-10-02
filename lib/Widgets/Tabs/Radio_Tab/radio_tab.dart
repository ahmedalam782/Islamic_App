import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app_route/Models/radio_model/radio.dart';
import 'package:islamic_app_route/Widgets/Tabs/Radio_Tab/radio_api.dart';
import 'package:provider/provider.dart';

import '../Settings_Tab/settings_provider.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  RadioApi radioApi = RadioApi();
  List<Radio> radio = [];
  int index = 0;
  late SettingsProvider settingsProvider;
  bool isPlayed = false;
  final player = AudioPlayer();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingsProvider>(context);
    getRadio();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_logo.png"),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .01,
        ),
        FutureBuilder<List<Radio>>(
          future: radioApi.getRadio(
              language: settingsProvider.lang == 'en' ? 'eng' : "ar"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.data!.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            } else {
              final radio = snapshot.data!;
              return Text(
                radio[index].name ??
                    AppLocalizations.of(context)!.holyQuranRadio,
                style: Theme.of(context).textTheme.headlineSmall,
              );
            }
          },
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                if (radio.length == index) return;
                if (isPlayed) {
                  await player.pause();
                  isPlayed = false;
                }
                index++;
                setState(() {});
              },
              icon: Icon(
                Icons.skip_previous,
                size: MediaQuery.sizeOf(context).height * .05,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (isPlayed) {
                  await player.pause();
                  isPlayed = false;
                } else {
                  await player.play(UrlSource(radio[index].url ?? ""));
                  isPlayed = true;
                }
                setState(() {});
              },
              icon: Icon(
                isPlayed ? Icons.stop : Icons.play_arrow,
                size: MediaQuery.sizeOf(context).height * .07,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (index == 0) return;
                if (isPlayed) {
                  await player.pause();
                  isPlayed = false;
                }
                index--;
                setState(() {});
              },
              icon: Icon(
                Icons.skip_next,
                size: MediaQuery.sizeOf(context).height * .05,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ],
        )
      ],
    );
  }

  getRadio() async {
    radio = await radioApi.getRadio(
        language: settingsProvider.lang == 'en' ? 'eng' : "ar");
  }
}
