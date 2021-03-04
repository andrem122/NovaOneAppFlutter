import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/screens.dart';

class SettingsLayout extends StatelessWidget {
  final User user;

  const SettingsLayout({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: SettingsMobilePortrait(user: user),
      ),
    );
  }
}
