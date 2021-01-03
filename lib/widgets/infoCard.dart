import 'package:flutter/material.dart';

class InfoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _InfoCard(title: 'Leads', iconData: Icons.person),
              ),
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
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
