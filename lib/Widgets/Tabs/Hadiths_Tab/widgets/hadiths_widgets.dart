import 'package:flutter/material.dart';

import '../../../../Models/hadith_model.dart';
import '../Hadith_details/hadith_details.dart';

class HadithsWidgets extends StatelessWidget {
  final HadithModel names;
  final int index;

  const HadithsWidgets({super.key, required this.names, required this.index});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          HadithDetails.routeName,
          arguments: HadithModel(name: names.name, index: index),
        );
      },
      child: Text(
        names.name,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
