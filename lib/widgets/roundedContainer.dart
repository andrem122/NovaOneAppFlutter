import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const RoundedContainer(
      {Key key,
      @required this.child,
      this.height,
      this.width = double.infinity})
      : assert(child != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Widget containerWithHeight = Container(
      padding: const EdgeInsets.all(10),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(containerBorderRadius)),
      child: child,
    );

    final Widget containerWithoutHeight = Container(
      padding: const EdgeInsets.all(10),
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(containerBorderRadius)),
      child: child,
    );
    return height != null ? containerWithHeight : containerWithoutHeight;
  }
}
