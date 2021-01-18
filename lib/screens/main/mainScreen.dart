import 'package:flutter/material.dart';
import 'package:novaone/responsive/orientationLayout.dart';
import 'package:novaone/responsive/screenTypeLayout.dart';
import 'package:novaone/screens/home/homeScreenMobile.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Widget homeScreen = ScreenTypeLayout(
    mobile: OrientationLayout(
      portrait: HomeMobilePortrait(),
    ),
  );

  List<Widget> get screens => [homeScreen];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homeScreen,
    );
  }
}
