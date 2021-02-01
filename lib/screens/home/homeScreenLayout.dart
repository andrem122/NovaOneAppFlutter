import 'package:flutter/material.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/screens.dart';

class HomeScreenLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(),
        landscape: HomeMobileLandscape(),
      ),
    );
  }
}
