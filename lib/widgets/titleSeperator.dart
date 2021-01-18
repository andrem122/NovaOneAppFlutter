import 'package:flutter/material.dart';

class TitleSeperator extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSeperator({Key key, @required this.title, @required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15),
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 15,
          ),
        ],
      ),
    );
  }
}
