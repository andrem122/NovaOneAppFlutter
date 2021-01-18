import 'package:flutter/material.dart';
import 'package:novaone/enums/deviceScreenType.dart';

DeviceScreenType getDeviceScreenType(
    {@required MediaQueryData mediaQueryData}) {
  double deviceWidth = mediaQueryData.size.shortestSide;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  } else if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
