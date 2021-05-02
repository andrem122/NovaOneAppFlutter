/// A container with a max width constraint

import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';

class MaxWidthContainer extends StatelessWidget {
  final Widget? child;

  const MaxWidthContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxContainerWidth),
      child: child,
    );
  }
}
