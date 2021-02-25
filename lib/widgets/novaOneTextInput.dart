import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/widgets/widgets.dart';

class NovaOneTextInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool autoFocus;

  const NovaOneTextInput(
      {Key key,
      this.hintText = 'Hint Text',
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.autoFocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
        constraints: BoxConstraints(maxWidth: maxContainerWidth),
        width: double.infinity,
        child: TextField(
          autofocus: autoFocus,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          textAlign: TextAlign.center,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: hintText),
        ));
  }
}
