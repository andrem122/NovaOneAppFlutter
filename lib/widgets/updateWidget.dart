import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/widgets/widgets.dart';

class UpdateWidget extends StatelessWidget {
  final String hintText;

  const UpdateWidget({Key key, this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        RoundedContainer(
          constraints: BoxConstraints(maxWidth: maxContainerWidth),
          width: double.infinity,
          child: TextField(
            autofocus: true,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.name,
            textAlign: TextAlign.center,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText),
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        NovaOneButton(
          onPressed: () => print(
            'Submit value to api and update in local store',
          ),
          title: 'Update',
        ),
      ],
    );
  }
}
