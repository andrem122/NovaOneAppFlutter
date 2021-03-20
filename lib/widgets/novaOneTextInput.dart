import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/widgets/widgets.dart';

class NovaOneTextInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool autoFocus;
  final TextAlign textAlign;
  final Border border;
  final String labelText;
  final BoxConstraints constraints;
  final double scaleTextSize;
  final TextEditingController controller;

  const NovaOneTextInput(
      {Key key,
      @required this.hintText,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.autoFocus = false,
      this.border,
      this.textAlign = TextAlign.center,
      this.labelText,
      this.scaleTextSize = 1,
      this.constraints = const BoxConstraints(maxWidth: maxContainerWidth),
      this.controller})
      : assert(hintText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        labelText != null
            ? Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  labelText,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15 * scaleTextSize),
                ),
              )
            : SizedBox.shrink(),
        RoundedContainer(
            border: border,
            constraints: constraints,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: TextField(
              controller: controller,
              autofocus: autoFocus,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 17 * scaleTextSize),
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              textAlign: textAlign,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hintText),
            )),
      ],
    );
  }
}
