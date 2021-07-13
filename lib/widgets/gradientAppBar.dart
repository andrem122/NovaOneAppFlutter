import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 50.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(
        gradient: Palette.greetingContainerGradient,
      ),
    );
  }
}
