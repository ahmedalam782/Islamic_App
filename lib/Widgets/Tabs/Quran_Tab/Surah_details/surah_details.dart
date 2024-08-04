import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app_route/Models/alayat_model.dart';
import 'package:islamic_app_route/Shared/Components/default_appbar.dart';
import 'package:islamic_app_route/Shared/Components/default_background_image.dart';
import 'package:islamic_app_route/Widgets/Tabs/Quran_Tab/Surah_details/widget/surah_content_design.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = "SurahDetails";

  const SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> chapterContent = [];

  @override
  Widget build(BuildContext context) {
    AlayatModel args =
        ModalRoute.of(context)?.settings.arguments as AlayatModel;
    if (chapterContent.isEmpty) {
      readFiles(args.index!);
    }
    return DefaultBackgroundImage(
      child: Scaffold(
        appBar: const DefaultAppbar(),
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.sizeOf(context).width * .05,
            right: MediaQuery.sizeOf(context).width * .05,
            bottom: MediaQuery.sizeOf(context).height * .03,
            top: MediaQuery.sizeOf(context).height * .01,
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
                        'سورة ${args.name}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.play_circle,
                        color: Theme.of(context).primaryColor,
                        size: MediaQuery.sizeOf(context).height * .04,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 4,
                  indent: MediaQuery.sizeOf(context).width * .12,
                  endIndent: MediaQuery.sizeOf(context).width * .12,
                  thickness: 1.3,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .01,
                ),
                chapterContent.isNotEmpty
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) => SurahContentDesign(
                            chapterContent: chapterContent[index],
                            index: index,
                          ),
                          separatorBuilder: (_, index) => SizedBox(
                            height: MediaQuery.sizeOf(context).height * .04,
                          ),
                          itemCount: chapterContent.length,
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
        .loadString('assets/files/quran/${chapterIndex + 1}.txt');
    chapterContent = text.split("\n");
    setState(() {});
  }
}
