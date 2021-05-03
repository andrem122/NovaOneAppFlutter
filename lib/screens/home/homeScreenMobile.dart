import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:novaone/models/models.dart';
import 'package:novaone/widgets/simpleBarChart.dart';
import 'package:novaone/widgets/titleSeperator.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../testData.dart';

class HomeMobilePortrait extends StatelessWidget {
  const HomeMobilePortrait({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final barChartWidth = 40.0;
    print('WIDTH: $barChartWidth');
    final User user = context.read<User>();
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: GreetingContainer(
            user: user,
            containerDecimalHeight: 0.30,
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                bottom: false,
                top: false,
                child: TitleSeperator(
                  title: 'An Overview',
                  subtitle: 'View all',
                  showSubtitle: true,
                ),
              ),
            )),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            sliver: SliverToBoxAdapter(
                child:
                    SafeArea(top: false, bottom: false, child: InfoCards()))),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                top: false,
                bottom: false,
                child: TitleSeperator(
                  title: 'Leads Per Month',
                  subtitle: 'View all',
                ),
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
              child: SafeArea(
            top: false,
            bottom: false,
            child: SimpleBarChart(
              barChartData: BarChartData(
                  borderData: FlBorderData(show: false),
                  alignment: BarChartAlignment.center,
                  barGroups: <BarChartGroupData>[
                    BarChartGroupData(x: 0, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 1, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 2, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 3, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 4, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 5, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 6, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 7, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 5,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 8, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 15,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 9, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 4,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 10, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 7,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                    BarChartGroupData(x: 11, barRods: <BarChartRodData>[
                      BarChartRodData(
                          y: 7,
                          borderRadius: BorderRadius.circular(4),
                          width: barChartWidth)
                    ]),
                  ]),
            ),
          )),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                top: false,
                bottom: false,
                child: TitleSeperator(
                  title: 'Recent Leads',
                  subtitle: 'View all',
                  showSubtitle: true,
                ),
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              bottom: false,
              child: RecentLeads(
                leads: recentLeads,
              ),
            ),
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                top: false,
                bottom: false,
                child: TitleSeperator(
                  title: 'Recent Appointments',
                  subtitle: 'View all',
                  showSubtitle: true,
                ),
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              bottom: false,
              child: RecentAppointments(
                appointments: recentAppointments,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeMobileLandscape extends StatelessWidget {
  const HomeMobileLandscape({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final User user = context.read<User>();
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: GreetingContainer(
            user: user,
            containerDecimalHeight: 0.60,
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                child: TitleSeperator(
                  title: 'An Overview',
                  subtitle: 'View all',
                  showSubtitle: true,
                ),
              ),
            )),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            sliver: SliverToBoxAdapter(child: SafeArea(child: InfoCards()))),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                child: TitleSeperator(
                  title: 'Leads Per Month',
                  subtitle: 'View all',
                ),
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
              child: SafeArea(
            child: SimpleBarChart(
              barChartData: BarChartData(
                  alignment: BarChartAlignment.center,
                  barGroups: <BarChartGroupData>[
                    BarChartGroupData(
                        x: 0,
                        barRods: <BarChartRodData>[BarChartRodData(y: 5)]),
                    BarChartGroupData(
                        x: 1,
                        barRods: <BarChartRodData>[BarChartRodData(y: 15)]),
                    BarChartGroupData(
                        x: 2,
                        barRods: <BarChartRodData>[BarChartRodData(y: 4)]),
                    BarChartGroupData(
                        x: 3,
                        barRods: <BarChartRodData>[BarChartRodData(y: 7)]),
                  ]),
            ),
          )),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                top: false,
                bottom: false,
                child: TitleSeperator(
                  title: 'Recent Leads',
                  subtitle: 'View all',
                  showSubtitle: true,
                ),
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              bottom: false,
              child: RecentLeads(
                leads: recentLeads,
              ),
            ),
          ),
        ),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: SafeArea(
                top: false,
                bottom: false,
                child: TitleSeperator(
                  title: 'Recent Appointments',
                  subtitle: 'View all',
                  showSubtitle: true,
                ),
              ),
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          sliver: SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              bottom: false,
              child: RecentAppointments(
                appointments: recentAppointments,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
