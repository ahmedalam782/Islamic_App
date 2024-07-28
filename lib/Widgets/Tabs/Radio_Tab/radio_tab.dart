import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_logo.png"),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .01,
        ),
        Text(
          "Holy Quran Radio",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous,
                size: MediaQuery.sizeOf(context).height * .05,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                size: MediaQuery.sizeOf(context).height * .07,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            IconButton(
              onPressed: () {},
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
}
