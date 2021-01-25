import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/widgets/widgets.dart';

class LeadDetailMobilePortrait extends StatelessWidget {
  final Lead lead;

  const LeadDetailMobilePortrait({Key key, this.lead}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: LeadDetailHeader(
            lead: lead,
            containerDecimalHeight: 0.30,
          ),
        ),
      ],
    );
  }
}
