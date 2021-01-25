import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/models/user.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/widgets/whiteButton.dart';

class GreetingContainer extends StatelessWidget {
  const GreetingContainer(
      {Key key, @required this.user, @required this.containerDecimalHeight})
      : super(key: key);

  final User user;
  final double containerDecimalHeight;

  String get currentWeekDay {
    DateTime date = DateTime.now();
    return DateFormat('EEEE').format(date);
  }

  String get greetingMessage =>
      'Hello ${user.firstName}! It\'s $currentWeekDay, and you have 200 leads.';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        gradient: Palette.greetingContainerGradient,
      ),
      height: MediaQuery.of(context).size.height *
          containerDecimalHeight, // 30% percent height of the device
      child: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Palette.secondaryColor,
                  child: Text(
                    'A',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                WhiteButton(
                  buttonText: 'Get Help',
                )
              ],
            ),
            const SizedBox(height: 40),
            Text(
              greetingMessage,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
