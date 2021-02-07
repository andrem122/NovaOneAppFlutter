import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/widgets/widgets.dart';

class LeadDetailMobilePortrait extends StatelessWidget {
  final Lead lead;
  final Color leadColor;
  final List<DetailTableItem> detailTableItems;

  const LeadDetailMobilePortrait(
      {Key key,
      this.lead,
      @required this.leadColor,
      @required this.detailTableItems})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: LeadDetailHeader(
            lead: lead,
            leadColor: leadColor,
            containerDecimalHeight: 0.20,
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 90, 0, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                bottom: false,
                top: false,
                child: TitleSeperator(
                  title: 'Lead Details',
                  subtitle: 'View all',
                  showSubtitle: false,
                ),
              ),
            )),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                bottom: false,
                top: false,
                child: DetailTable(
                  detailTableItems: detailTableItems,
                ),
              ),
            )),
      ],
    );
  }
}
