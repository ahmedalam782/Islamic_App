import 'package:flutter/material.dart';

import '../../../../Models/alayat_model.dart';
import 'alayat_widgets.dart';

class AlayatList extends StatelessWidget {
  const AlayatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (_, index) => AlayatWidgets(
          names: AlayatModel.alayat()[index],
          index: index,
        ),
        itemCount: AlayatModel.alayat().length,
      ),
    );
  }
}
