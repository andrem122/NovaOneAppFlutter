import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/widgets/circleButton.dart';

class InfoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        child: Row(
          children: <Widget>[
            _InfoCard(
              iconData: Icons.person,
              number: 100000,
              title: 'Leads',
            ),
            _InfoCard(
              iconData: Icons.person,
              number: 200,
              title: 'Appointments',
            ),
            _InfoCard(
              iconData: Icons.person,
              number: 300,
              title: 'Companies',
            )
          ],
        ));
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final int number;

  const _InfoCard(
      {Key key,
      @required this.title,
      @required this.iconData,
      @required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 50,
                    color: Palette.primaryColor.withOpacity(0.23),
                    offset: Offset(0, 10)),
              ],
            ),
            height: double.infinity,
          ),
          Positioned(
            top: 8,
            left: 8,
            child: CircleButton(
              iconData: Icons.add,
              onPressed: () => print('Adding'),
              backgroundColor: Palette.primaryColor,
              iconColor: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  size: 35,
                ),
                Text(
                  '$number',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Palette.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
