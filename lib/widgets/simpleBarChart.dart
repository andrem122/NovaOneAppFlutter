import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'package:novaone/palette.dart';

class SimpleBarChart extends StatelessWidget {
  final bool animate;
  final List<charts.Series> seriesList;

  SimpleBarChart({Key key, this.animate = false, @required this.seriesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final charts.NumericAxisSpec axis = charts.NumericAxisSpec(
        renderSpec: charts.GridlineRendererSpec(
            labelStyle: charts.TextStyleSpec(
                fontSize: 13, color: charts.MaterialPalette.black)));

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      height: 300,
      width: double.infinity,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return Palette.greetingContainerGradient.createShader(bounds);
        },
        child: charts.BarChart(
          seriesList,
          primaryMeasureAxis: axis,
          domainAxis: new charts.OrdinalAxisSpec(
              renderSpec: new charts.SmallTickRendererSpec(

                  // Tick and Label styling here.
                  labelStyle: new charts.TextStyleSpec(
                    fontSize: 8, // size in Pts.
                  ),

                  // Change the line colors to match text color.
                  lineStyle: new charts.LineStyleSpec(
                      color: charts.MaterialPalette.black))),
          animate: animate,
        ),
        blendMode: BlendMode.srcATop,
      ),
    );
  }
}
