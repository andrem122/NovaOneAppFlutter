import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/palette.dart';

class GradientHeader extends StatelessWidget {
  final double containerDecimalHeight;
  final Widget child;

  const GradientHeader(
      {Key key,
      this.containerDecimalHeight = 0.30,
      this.child = const SizedBox.shrink()})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        gradient: Palette.greetingContainerGradient,
      ),
      height: MediaQuery.of(context).size.height *
          containerDecimalHeight, // 30% percent height of the device by default
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: child,
    );
  }
}
