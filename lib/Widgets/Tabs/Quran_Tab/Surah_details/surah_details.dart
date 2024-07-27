import 'package:flutter/material.dart';
import 'package:islamic_app_route/Shared/Components/default_appbar.dart';
import 'package:islamic_app_route/Shared/Components/default_background_image.dart';

import '../../../../Models/sura_details_args.dart';

class SurahDetails extends StatelessWidget {
  static const String routeName = "SurahDetails";

  const SurahDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    return DefaultBackgroundImage(
      child: Scaffold(
        appBar: const DefaultAppbar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * .05,
            right: MediaQuery.sizeOf(context).width * .05,
            bottom: MediaQuery.sizeOf(context).width * .20,
            top: MediaQuery.sizeOf(context).width * .05,
          ),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'سورة ${args.title}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.play_circle,
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  indent: MediaQuery.sizeOf(context).width * .12,
                  endIndent: MediaQuery.sizeOf(context).width * .12,
                  thickness: 1.3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
