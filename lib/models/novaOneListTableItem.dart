import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/palette.dart';

/// The model used for the data in the NovaOneListTableItem Widget
class NovaOneListTableItemData extends NovaOneTableItemData {
  final String title;
  final String subtitle;
  final Color color;
  final List<PopupMenuEntry> popupMenuOptions;

  NovaOneListTableItemData({
    @required this.title,
    this.color = Palette.primaryColor,
    @required this.popupMenuOptions,
    @required this.subtitle,
  })  : assert(title != null),
        assert(popupMenuOptions != null),
        assert(subtitle != null),
        super(title: title, subtitle: subtitle);

  @override
  List<Object> get props => [title, subtitle, color, popupMenuOptions];
}
