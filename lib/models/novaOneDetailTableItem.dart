import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/palette.dart';

class NovaOneDetailTableItemData extends NovaOneTableItemData {
  final String title;
  final String subtitle;
  final String updateTitle;
  final String updateDescription;
  final IconData iconData;
  final Color iconColor;
  final TextInputType keyboardType;
  final String updateFieldHintText;
  final UpdateWidgetType updateWidget;
  final List<PopupMenuEntry> popupMenuOptions;

  const NovaOneDetailTableItemData(
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
        assert(iconData != null),
        super(title: title, subtitle: subtitle);
}
