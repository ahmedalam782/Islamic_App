import 'package:flutter/material.dart';

class SurahContentDesign extends StatelessWidget {
  final String chapterContent;
  final int index;

  const SurahContentDesign({
    super.key,
    required this.chapterContent,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            chapterContent,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                shape: BoxShape.circle,
              ),
              child: Text(
                "${index + 1}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                    ),
              ),
            ),
            Expanded(
              child: Divider(
                endIndent: MediaQuery.sizeOf(context).width * .05,
                height: 0,
                thickness: 0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
