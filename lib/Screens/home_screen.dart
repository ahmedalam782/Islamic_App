import 'package:flutter/material.dart';
import 'package:islamic_app_route/Shared/Components/default_appbar.dart';
import 'package:islamic_app_route/Shared/Components/default_background_image.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundImage(
      child: Scaffold(
        appBar: DefaultAppbar(),
      ),
    );
  }
}
