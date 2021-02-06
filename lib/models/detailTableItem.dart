import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';

class DetailTableItem {
  final String title;
  final String subtitle;
  final IconData iconData;
  final Color iconColor;
  final List<PopupMenuEntry> popupMenuOptions;

  DetailTableItem(
      {@required this.title,
      @required this.popupMenuOptions,
      @required this.subtitle,
      @required this.iconData,
      this.iconColor = Palette.primaryColor});
}
