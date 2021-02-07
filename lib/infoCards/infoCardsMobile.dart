import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/widgets/circleButton.dart';

import '../constants.dart';

class InfoCardsMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _InfoCardMobile(
          onAdd: () => print('Go to add leads screen'),
          iconData: Icons.people,
          onTap: () => print('Go to leads screen'),
          number: 100000,
          title: 'Leads',
          marginBottom: 5,
          iconColor: Palette.secondaryColor,
        ),
        _InfoCardMobile(
          onAdd: () => print('Go to add appointments screen'),
          onTap: () => print('Go to appointments screen'),
          iconData: Icons.perm_contact_calendar,
          number: 200,
          title: 'Appointments',
          marginBottom: 5,
          iconColor: Palette.purpleColor,
        ),
        _InfoCardMobile(
          onAdd: () => print('Go to add companies screen'),
          onTap: () => print('Go to companies screen'),
          iconData: Icons.business,
          number: 300,
          title: 'Companies',
          iconColor: Palette.indigoColor,
        )
      ],
    ));
  }
}

class _InfoCardMobile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final int number;
  final double marginBottom;
  final Function() onAdd;
  final Function() onTap;
  final Color iconColor;

  const _InfoCardMobile(
      {Key key,
      @required this.title,
      @required this.iconData,
      @required this.number,
      this.marginBottom = 0,
      @required this.onAdd,
      this.iconColor,
      @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom > 0
          ? EdgeInsets.only(bottom: marginBottom)
          : EdgeInsets.only(bottom: 0),
      height: 120,
      width: double.infinity,
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
                  onPressed: onAdd,
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
                      color: iconColor,
                    ),
                    Text(
                      '$number',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 37,
                  right: 8,
                  child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios_sharp),
                      onPressed: onAdd))
            ],
          ),
        ),
      ),
    );
  }
}
