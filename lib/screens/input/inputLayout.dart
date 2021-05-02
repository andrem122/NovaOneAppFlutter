import 'package:flutter/material.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/responsive/responsive.dart';
import '../screens.dart';

class InputLayout extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;
  final InputWidgetType inputWidgetType;
  final IconData backIcon;

  const InputLayout({
    Key? key,
    required this.title,
    required this.description,
    required this.hintText,
    required this.inputWidgetType,
    this.backIcon = Icons.arrow_back_sharp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ScreenTypeLayout(
          mobile: OrientationLayout(
        portrait: InputMobilePortrait(
          inputWidgetType: inputWidgetType,
          description: description,
          title: title,
          hintText: hintText,
          backIcon: backIcon,
        ),
      )),
    );
  }
}
