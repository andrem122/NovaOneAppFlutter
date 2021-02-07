import 'package:flutter/material.dart';
import 'package:novaone/infoCards/infoCards.dart';
import 'package:novaone/responsive/screenTypeLayout.dart';

class InfoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: InfoCardsMobile(),
      tablet: InfoCardsTablet(),
      desktop: InfoCardsTablet(),
    );
  }
}
