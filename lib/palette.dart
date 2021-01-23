import 'dart:ui';

import 'package:flutter/material.dart';

class Palette {
  // Colors used throughout the app
  static const primaryColor = Color(0xff536cdb);
  static const secondaryColor = Color(0xff8cc1ff);
  static const teritiaryColor = Color(0xff2b2963);
  static const purpleColor = Color(0xff7E53DB);
  static const indigoColor = Color(0xff2B4AD0);
  static const boxShadow = Color(0xff0C9869);

  static const LinearGradient greetingContainerGradient = LinearGradient(
      colors: [primaryColor, purpleColor, indigoColor, Color(0xff53B0DB)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 0.2, 0.5, 0.8] //stops for individual color
      //set the stops number equal to numbers of color
      );
}
