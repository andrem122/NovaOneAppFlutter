import 'package:flutter/material.dart';

import '../palette.dart';

/// The circle button with options to specify icon and background color

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key key,
    @required this.iconData,
    @required this.onPressed,
    this.iconColor = Palette.primaryColor,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final IconData iconData;
  final Function onPressed;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(iconData),
        iconSize: 30,
        onPressed: onPressed,
        color: iconColor,
      ),
    );
  }
}
