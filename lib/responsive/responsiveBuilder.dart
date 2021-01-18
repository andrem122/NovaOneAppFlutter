import 'package:flutter/material.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/utils/uiUtils.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) builder;

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      final MediaQueryData mediaQueryData = MediaQuery.of(context);
      final SizingInformation sizingInformation = SizingInformation(
          deviceScreenType: getDeviceScreenType(mediaQueryData: mediaQueryData),
          screenSize: mediaQueryData.size,
          localWidgetSize:
              Size(boxConstraints.maxWidth, boxConstraints.maxHeight));

      return builder(context, sizingInformation);
    });
  }
}
