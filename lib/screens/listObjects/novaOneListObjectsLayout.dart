import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/screens.dart';

class NovaOneListObjectsLayout extends StatelessWidget {
  final List<NovaOneTableItem> tableItems;

  const NovaOneListObjectsLayout({Key key, @required this.tableItems})
      : assert(tableItems != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: NovaOneListObjectsMobilePortrait(tableItems: tableItems),
      ),
    );
  }
}
