import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:novaone/utils/utils.dart';
import 'package:novaone/constants.dart';

class NovaOneBinaryInput extends StatelessWidget {
  final Function() onPressedYes;
  final Function() onPressedNo;

  NovaOneBinaryInput(
      {Key? key, required this.onPressedYes, required this.onPressedNo})
      : super(key: key);

  /// Returns the appropriate list of children based on the type of the device
  List<Widget> _getChildren({required DeviceScreenType deviceScreenType}) {
    List<Widget> children = [];
    switch (deviceScreenType) {
      case DeviceScreenType.Mobile:
        children = [
          NovaOneButton(
            color: Palette.primaryColor,
            constraints: const BoxConstraints(
                minWidth: minButtonWidth,
                minHeight: minButtonHeight,
                maxWidth: 200),
            onPressed: onPressedYes,
            title: 'Yes',
          ),
          const SizedBox(
            height: 20,
          ),
          NovaOneButton(
            color: Palette.secondaryColor,
            constraints: const BoxConstraints(
                minWidth: minButtonWidth,
                minHeight: minButtonHeight,
                maxWidth: 200),
            onPressed: onPressedNo,
            title: 'No',
          ),
        ];
        break;
      case DeviceScreenType.Tablet:
        children = [
          NovaOneButton(
            color: Palette.primaryColor,
            constraints: const BoxConstraints(
                minWidth: minButtonWidth,
                minHeight: minButtonHeight,
                maxWidth: 250),
            onPressed: onPressedYes,
            title: 'Yes',
          ),
          const SizedBox(
            width: 60,
          ),
          NovaOneButton(
            color: Palette.secondaryColor,
            constraints: const BoxConstraints(
                minWidth: minButtonWidth,
                minHeight: minButtonHeight,
                maxWidth: 250),
            onPressed: onPressedNo,
            title: 'No',
          ),
        ];
        break;
      case DeviceScreenType.Desktop:
        children = [
          NovaOneButton(
            color: Palette.primaryColor,
            constraints: const BoxConstraints(
                minWidth: minButtonWidth,
                minHeight: minButtonHeight,
                maxWidth: 250),
            onPressed: onPressedYes,
            title: 'Yes',
          ),
          const SizedBox(
            width: 60,
          ),
          NovaOneButton(
            color: Palette.secondaryColor,
            constraints: const BoxConstraints(
                minWidth: minButtonWidth,
                minHeight: minButtonHeight,
                maxWidth: 250),
            onPressed: onPressedNo,
            title: 'No',
          ),
        ];
        break;
    }

    return children;
  }

  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceScreenType =
        getDeviceScreenType(mediaQueryData: MediaQuery.of(context));

    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getChildren(deviceScreenType: deviceScreenType),
        ),
        landscape: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getChildren(deviceScreenType: deviceScreenType),
        ),
      ),
      tablet: MaxWidthContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getChildren(deviceScreenType: deviceScreenType),
        ),
      ),
      desktop: MaxWidthContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _getChildren(deviceScreenType: deviceScreenType),
        ),
      ),
    );
  }
}
