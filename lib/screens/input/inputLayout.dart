import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/responsive/responsive.dart';
import '../screens.dart';

class InputLayout extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;
  final InputWidget inputWidget;

  const InputLayout({
    Key key,
    @required this.title,
    @required this.description,
    this.hintText,
    @required this.inputWidget,
  })  : assert(title != null),
        assert(description != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        mobile: OrientationLayout(
      portrait: InputMobilePortrait(),
    ));
  }
}
