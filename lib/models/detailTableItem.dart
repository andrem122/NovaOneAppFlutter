import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/palette.dart';

class DetailTableItem {
  final String title;
  final String updateTitle;
  final String updateDescription;
  final String subtitle;
  final IconData iconData;
  final Color iconColor;
  final TextInputType keyboardType;
  final String updateFieldHintText;
  final UpdateWidgetType updateWidget;
  final List<PopupMenuEntry> popupMenuOptions;

  DetailTableItem(
      {@required this.title,
      @required this.updateTitle,
      @required this.updateWidget,
      this.keyboardType = TextInputType.text,
      this.updateFieldHintText = 'Update Value',
      @required this.updateDescription,
      @required this.popupMenuOptions,
      @required this.subtitle,
      @required this.iconData,
      this.iconColor = Palette.primaryColor})
      : assert(title != null),
        assert(updateTitle != null),
        assert(updateDescription != null),
        assert(popupMenuOptions != null),
        assert(subtitle != null),
        assert(iconData != null);
}
