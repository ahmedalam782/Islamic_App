import 'package:flutter/material.dart';
import 'package:islamic_app_route/Shared/Components/default_appbar.dart';
import 'package:islamic_app_route/Shared/Components/default_background_image.dart';

import '../../../../Models/hadith_model.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = "HadithDetails";

  const HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadithModel args =
        ModalRoute.of(context)?.settings.arguments as HadithModel;
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
                Text(
                  args.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                Divider(
                  height: 5,
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
