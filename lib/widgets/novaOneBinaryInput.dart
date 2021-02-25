import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/widgets/widgets.dart';

class NovaOneBinaryInput extends StatelessWidget {
  final Function() onPressedYes;
  final Function() onPressedNo;
  List<Widget> mobileChildren;
  List<Widget> tabletChildren;
  List<Widget> desktopChildren;

  NovaOneBinaryInput(
      {Key key, @required this.onPressedYes, @required this.onPressedNo})
      : assert(onPressedYes != null),
        assert(onPressedNo != null),
        super(key: key) {
    mobileChildren = [
      NovaOneButton(
        color: Palette.primaryColor,
        width: 200,
        onPressed: onPressedYes,
        title: 'Yes',
      ),
      const SizedBox(
        height: 20,
      ),
      NovaOneButton(
        color: Palette.secondaryColor,
        width: 200,
        onPressed: onPressedNo,
        title: 'No',
      ),
    ];

    tabletChildren = [
      NovaOneButton(
        color: Palette.primaryColor,
        width: 250,
        onPressed: onPressedYes,
        title: 'Yes',
      ),
      const SizedBox(
        width: 60,
      ),
      NovaOneButton(
        color: Palette.secondaryColor,
        width: 250,
        onPressed: onPressedNo,
        title: 'No',
      ),
    ];

    desktopChildren = [
      NovaOneButton(
        color: Palette.primaryColor,
        width: 250,
        onPressed: onPressedYes,
        title: 'Yes',
      ),
      const SizedBox(
        width: 60,
      ),
      NovaOneButton(
        color: Palette.secondaryColor,
        width: 250,
        onPressed: onPressedNo,
        title: 'No',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: mobileChildren,
        ),
        landscape: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: mobileChildren,
        ),
      ),
      tablet: MaxWidthContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tabletChildren,
        ),
      ),
      desktop: MaxWidthContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: desktopChildren,
        ),
      ),
    );
  }
}
