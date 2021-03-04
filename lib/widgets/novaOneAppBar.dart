import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';

class NovaOneAppBar extends StatelessWidget {
  final String title;
  final double height;

  const NovaOneAppBar({Key key, @required this.title, this.height = 50})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
        top: statusbarHeight,
      ),
      height: statusbarHeight + height,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      decoration: BoxDecoration(gradient: Palette.greetingContainerGradient),
    );
  }
}
