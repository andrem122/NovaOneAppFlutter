import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/responsive/responsive.dart';
import 'package:novaone/screens/screens.dart';

class LeadDetailLayout extends StatelessWidget {
  final Lead lead;
  final Color leadColor;
  final List<NovaOneTableItem> detailTableItems;

  const LeadDetailLayout(
      {Key key,
      @required this.lead,
      @required this.leadColor,
      @required this.detailTableItems})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: LeadDetailMobilePortrait(
              lead: lead, leadColor: leadColor, tableItems: detailTableItems),
        ),
      ),
    );
  }
}
