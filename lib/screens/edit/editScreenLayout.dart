import 'package:flutter/material.dart';
import 'package:novaone/responsive/responsive.dart';
import '../screens.dart';

class EditScreenLayout extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;

  const EditScreenLayout(
      {Key key,
      @required this.title,
      @required this.description,
      this.hintText})
      : assert(title != null),
        assert(description != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: OrientationLayout(
      portrait: EditScreenMobilePortrait(
        title: title,
        description: description,
        hintText: hintText,
      ),
    ));
  }
}
