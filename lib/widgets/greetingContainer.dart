import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:novaone/constants.dart';
import 'package:novaone/models/user.dart';

class GreetingContainer extends StatelessWidget {
  const GreetingContainer({Key key, @required this.user}) : super(key: key);

  final User user;
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
      color: Colors.white,
      child: Text(
        greetingMessage,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
    );
  }
}
