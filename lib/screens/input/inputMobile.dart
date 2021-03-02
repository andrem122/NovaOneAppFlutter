import 'package:flutter/material.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/enums/enums.dart';
import 'package:novaone/widgets/widgets.dart';

class InputMobilePortrait extends StatelessWidget {
  final String title;
  final String description;
  final String hintText;
  final InputWidgetType inputWidgetType;
  final IconData backIcon;

  const InputMobilePortrait(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.hintText,
      @required this.inputWidgetType,
      this.backIcon = Icons.arrow_back_sharp})
      : assert(title != null),
        assert(description != null),
        assert(hintText != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // Show keyboard on widget load

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  GradientHeader(
                    containerDecimalHeight: 0.30,
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(
                              backIcon,
                              color: Colors.white,
                              size: backButtonSize,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    description,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: InputWidget(
                      inputWidgeType: inputWidgetType,
                      hintText: hintText,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: NovaOneButton(
                margin: EdgeInsets.only(bottom: 20),
                onPressed: () => print(
                  'Submit value to api and update in local store',
                ),
                title: 'Update',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
