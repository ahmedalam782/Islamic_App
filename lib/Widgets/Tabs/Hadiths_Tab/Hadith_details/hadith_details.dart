import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app_route/Shared/Components/default_appbar.dart';
import 'package:islamic_app_route/Shared/Components/default_background_image.dart';

import '../../../../Models/hadith_model.dart';

class HadithDetails extends StatefulWidget {
  static const String routeName = "HadithDetails";

  const HadithDetails({super.key});

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  List<String> hadithContent = [];

  @override
  Widget build(BuildContext context) {
    HadithModel args =
        ModalRoute.of(context)?.settings.arguments as HadithModel;
    if (hadithContent.isEmpty) {
      readFiles(args.index!);
    }
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
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .03,
                ),
                hadithContent.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.sizeOf(context).width * .08,
                            ),
                            child: Text(
                              "${hadithContent[index]} ",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                          separatorBuilder: (_, index) => SizedBox(
                            height: MediaQuery.sizeOf(context).height * .04,
                          ),
                          itemCount: hadithContent.length,
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void readFiles(int chapterIndex) async {
    String text = await rootBundle
        .loadString('assets/files/hadiths/h${chapterIndex + 1}.txt');
    hadithContent = text.split("\n");
    setState(() {});
  }
}
