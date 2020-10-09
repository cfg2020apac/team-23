import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Progress {
  final String year;
  final int score;
  final charts.Color barColor;

  Progress(
      {@required this.barColor, @required this.year, @required this.score});
}

class ProgressChart extends StatelessWidget {
  final List<Progress> data;

  ProgressChart({this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<Progress, String>> series = [
      charts.Series(
          id: "1",
          data: data,
          domainFn: (Progress series, _) => series.year,
          measureFn: (Progress series, _) => series.score,
          colorFn: (Progress series, _) => series.barColor)
    ];
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Service Hour Chart'),
                Expanded(
                  child: charts.BarChart(
                    series,
                    animate: true,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
