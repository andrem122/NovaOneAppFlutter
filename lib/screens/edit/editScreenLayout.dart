import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/responsive/responsive.dart';
import '../screens.dart';

class EditScreenLayout extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;
  final UpdateWidgetType updateWidget;

  const EditScreenLayout(
      {Key key,
      @required this.title,
      @required this.description,
      this.hintText,
      @required this.updateWidget})
      : assert(title != null),
        assert(description != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: OrientationLayout(
      portrait: EditScreenMobilePortrait(
        updateWidget: updateWidget,
        title: title,
        description: description,
        hintText: hintText,
      ),
    ));
  }
}
