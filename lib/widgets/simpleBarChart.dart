import 'package:flutter/material.dart';
import 'package:novaone/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';

class SimpleBarChart extends StatelessWidget {
  final BarChartData barChartData;

  SimpleBarChart({Key? key, required this.barChartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      height: 300,
      width: double.infinity,
      child: BarChart(
        barChartData,
        swapAnimationDuration: Duration(milliseconds: 150), // Optional
        swapAnimationCurve: Curves.linear, // Optional
      ),
    );
  }
}
