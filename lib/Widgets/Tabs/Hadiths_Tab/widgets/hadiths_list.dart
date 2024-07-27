import 'package:flutter/material.dart';
import 'package:islamic_app_route/Models/hadith_model.dart';

import 'hadiths_widgets.dart';

class HadithsList extends StatelessWidget {
  const HadithsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) => HadithsWidgets(
          names: HadithModel.hadiths()[index],
          index: index,
        ),
        itemCount: HadithModel.hadiths().length,
      ),
    );
  }
}
