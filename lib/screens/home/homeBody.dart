import 'package:flutter/material.dart';
import 'package:novaone/localizations.dart';
import 'package:novaone/palette.dart';
import 'package:novaone/widgets/widgets.dart';

import '../../testData.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            NovaOneLocalizations.appName,
            style: TextStyle(
                color: Palette.primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          centerTitle: false,
          floating: true,
          actions: <Widget>[
            CircleButton(
              iconData: Icons.search,
              onPressed: () => print('Search'),
              backgroundColor: Palette.primaryColor,
              iconColor: Colors.white,
            ),
            CircleButton(
              iconData: Icons.help_sharp,
              onPressed: () => print('Help'),
              backgroundColor: Palette.primaryColor,
              iconColor: Colors.white,
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: GreetingContainer(user: currentUser),
        ),
      ],
    );
  }
}
