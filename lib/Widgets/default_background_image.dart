import 'package:flutter/material.dart';

class DefaultBackgroundImage extends StatelessWidget {
  const DefaultBackgroundImage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/default_bg.png"),
        ),
      ),
      child: child,
    );
  }
}
