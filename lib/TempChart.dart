/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(seriesList, animate: animate);
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
        final fakeBedDataTarget = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    var fakeBedDataActual = [
      new LinearSales(0, 20),
      new LinearSales(1, 30),
      new LinearSales(2, 3),
      new LinearSales(3, 5),
    ];
    var fakeHotendDataActual = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 200),
      new LinearSales(3, 150),
    ];

    var fakeHotendDataTarget = [
      new LinearSales(0, 15),
      new LinearSales(1, 75),
      new LinearSales(2, 300),
      new LinearSales(3, 225),
    ];

return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.Color(r: 135, g: 144, b: 251, a: 180),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: fakeBedDataTarget,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet2',
        colorFn: (_, __) => charts.Color(r: 1, g: 25, b: 250, a: 255),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: fakeBedDataActual,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.Color(r: 255, g: 0, b: 20, a: 255),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: fakeHotendDataActual,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.Color(r: 255, g: 139, b: 144, a: 255),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: fakeHotendDataTarget,
      ),
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class TempChart extends StatelessWidget {
  const TempChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: SimpleLineChart.withSampleData(),
          top: 0,
          left: 0,
          right: 0,
          bottom: 60,
        ),
        Positioned(
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      Container(height: 10, width: 10, color: Color.fromARGB(255, 1,  25,  250),),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('Actual Bed'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      Container(height: 10, width: 10, color: Color.fromARGB(180,135, 144, 251),),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('Target Bed'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      Container(height: 10, width: 10, color: Colors.red,),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('Actual Extruder'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Row(
                    children: <Widget>[
                      Container(height: 10, width: 10, color: Color.fromARGB(255,255, 139, 144),),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text('Target Extruder'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottom: 0,
          left: 0,
          right: 0,
          height: 60,
        )
      ],
    );
  }
}