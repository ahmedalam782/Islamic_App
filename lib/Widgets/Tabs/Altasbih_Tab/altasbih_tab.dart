import 'package:flutter/material.dart';

class AltasbihTab extends StatefulWidget {
  const AltasbihTab({super.key});

  @override
  State<AltasbihTab> createState() => _AltasbihTabState();
}

class _AltasbihTabState extends State<AltasbihTab> {
  int currentIndex = 0;
  int count = 0;
  double angle = 0;
  List<String> namesOfSebiha = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله',
    'ولا حول ولا قوة إلا بالله',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                "assets/images/head of seb7a.png",
                height: MediaQuery.sizeOf(context).height * .12,
              ),
              GestureDetector(
                onTap: () => changeCountSebihaAndRotate(),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .031,
                  ),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      "assets/images/body of seb7a.png",
                      height: MediaQuery.sizeOf(context).height * .42,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              "Numbers Of Tasbeehs ",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            margin: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.sizeOf(context).height * .025,
              ),
              color: Theme.of(context).secondaryHeaderColor.withOpacity(.57),
            ),
            child: Text(
              "$count",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            margin: EdgeInsets.all(
              MediaQuery.sizeOf(context).height * .016,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.sizeOf(context).height * .025,
              ),
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Text(
              namesOfSebiha[currentIndex],
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  void changeCountSebihaAndRotate() {
    count++;
    if (count % 33 == 0) {
      currentIndex++;
    }
    angle += 360 / 33;
    if (currentIndex == namesOfSebiha.length) {
      currentIndex = 0;
      count = 0;
      angle = 0;
    }
    setState(() {});
  }
}
