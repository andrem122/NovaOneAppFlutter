import 'package:flutter/material.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/widgets/circleButton.dart';

class InfoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _InfoCard(title: 'Leads', iconData: Icons.person),
            );
          }),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData iconData;

  const _InfoCard({Key key, @required this.title, @required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width / 3) -
              12, // subtract horizontal padding
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
      ],
    );
  }
}
