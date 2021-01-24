import 'package:flutter/material.dart';
import 'package:novaone/widgets/simpleBarChart.dart';
import 'package:novaone/widgets/titleSeperator.dart';
import 'package:novaone/widgets/widgets.dart';

import '../../testData.dart';

class HomeMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: GreetingContainer(user: currentUser),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            sliver: SliverToBoxAdapter(
              child: TitleSeperator(
                title: 'An Overview',
                subtitle: 'View all',
                showSubtitle: true,
              ),
            )),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            sliver: SliverToBoxAdapter(child: InfoCards())),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: TitleSeperator(
                title: 'Leads Per Month',
                subtitle: 'View all',
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
              child: SimpleBarChart(
            seriesList: seriesList,
            animate: true,
          )),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: TitleSeperator(
                title: 'Recent Leads',
                subtitle: 'View all',
                showSubtitle: true,
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recentLeads.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2, color: Colors.grey[200]),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            child: Text(recentLeads[index].name[0]),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        )
      ],
    );
  }
}
