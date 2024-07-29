import 'package:flutter/material.dart';
import 'package:islamic_app_route/Models/alayat_model.dart';
import 'package:islamic_app_route/Widgets/Tabs/Quran_Tab/Surah_details/surah_details.dart';


class AlayatWidgets extends StatelessWidget {
  final AlayatModel names;
  final int index;

  const AlayatWidgets({super.key, required this.names, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          SurahDetails.routeName,
          arguments: AlayatModel(name: names.name, index: index),
        );
      },
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.sizeOf(context).height * .009),
                child: Text(
                  names.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const VerticalDivider(
              width: 0,
            ),
            Expanded(
              child: Text(
                '${names.number}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
