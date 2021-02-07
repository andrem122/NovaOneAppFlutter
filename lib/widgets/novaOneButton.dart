import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';

class NovaOneButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const NovaOneButton(
      {Key key, @required this.onPressed, this.title = 'Submit'})
      : assert(onPressed != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: Palette.greetingContainerGradient,
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              minHeight: 50.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}