import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/widgets/circleButton.dart';

import '../constants.dart';

class InfoCardsTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _InfoCardTablet(
              onAdd: () => print('Adding'),
              onTap: () => print('Adding'),
              iconData: Icons.person,
              number: 100000,
              title: 'Leads',
              marginRight: 5,
            ),
            _InfoCardTablet(
              onAdd: () => print('Adding'),
              onTap: () => print('Adding'),
              iconData: Icons.person,
              number: 2000,
              title: 'Appointments',
              marginRight: 5,
            ),
            _InfoCardTablet(
              onAdd: () => print('Adding'),
              onTap: () => print('Adding'),
              iconData: Icons.person,
              number: 3000,
              title: 'Companies',
            )
          ],
        ));
  }
}

class _InfoCardTablet extends StatelessWidget {
  final String title;
  final IconData iconData;
  final int number;
  final Function() onTap;
  final Function() onAdd;
  final double marginRight;

  const _InfoCardTablet(
      {Key key,
      @required this.title,
      @required this.iconData,
      @required this.number,
      this.marginRight = 0,
      @required this.onTap,
      @required this.onAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: marginRight > 0
            ? EdgeInsets.only(right: marginRight)
            : EdgeInsets.only(right: 0),
        height: double.infinity,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                blurRadius: 50,
                color: Palette.primaryColor.withOpacity(0.23),
                offset: Offset(0, 10)),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(containerBorderRadius),
          color: Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(containerBorderRadius),
            onTap: onTap,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 8,
                  left: 8,
                  child: CircleButton(
                    iconData: Icons.add,
                    onPressed: () => onAdd,
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
