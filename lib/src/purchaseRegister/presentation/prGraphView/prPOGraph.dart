import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class POGraphModel extends StatelessWidget {
  const POGraphModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Radial Chart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, size: 40),
                ),
              ],
            ),
            SizedBox(height: 30),
            SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  radiusFactor: 0.5,
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: 80,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Colors.blue,
                      enableAnimation: true,
                      animationDuration: 1500,
                    ),
                  ],
                  interval: 5,
                  startAngle: 5,
                  endAngle: 5,
                  showTicks: false,
                  showLabels: false,
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '98%',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Broswer',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      angle: 270,
                      positionFactor: 0.1,
                    ),
                  ],
                ),
                RadialAxis(
                  radiusFactor: 0.6,
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: 50,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Colors.red[800],
                      animationDuration: 1500,
                      enableAnimation: true,
                    ),
                  ],
                  interval: 5,
                  startAngle: 5,
                  endAngle: 5,
                  showTicks: false,
                  showLabels: false,
                  // annotations: <GaugeAnnotation>[
                  //   GaugeAnnotation(
                  //     widget: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [Text('98%'), Text('Broswer')],
                  //     ),
                  //     angle: 270,
                  //     positionFactor: 0.1,
                  //   ),
                  // ],
                ),
                RadialAxis(
                  radiusFactor: 0.7,
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: 60,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Colors.purple,
                      enableAnimation: true,
                      animationDuration: 1500,
                    ),
                  ],
                  interval: 5,
                  startAngle: 5,
                  endAngle: 5,
                  showTicks: false,
                  showLabels: false,
                  // annotations: <GaugeAnnotation>[
                  //   GaugeAnnotation(
                  //     widget: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [Text('98%'), Text('Broswer')],
                  //     ),
                  //     angle: 270,
                  //     positionFactor: 0.1,
                  //   ),
                  // ],
                ),
                RadialAxis(
                  radiusFactor: 0.8,
                  pointers: <GaugePointer>[
                    RangePointer(
                      value: 90,
                      cornerStyle: CornerStyle.bothCurve,
                      color: Colors.amber,
                      enableAnimation: true,
                    ),
                  ],
                  interval: 5,
                  startAngle: 5,
                  endAngle: 5,
                  showTicks: false,
                  showLabels: false,
                  // annotations: <GaugeAnnotation>[
                  //   GaugeAnnotation(
                  //     widget: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [Text('98%'), Text('Broswer')],
                  //     ),
                  //     angle: 270,
                  //     positionFactor: 0.1,
                  //   ),
                  // ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChartColumnData {
  ChartColumnData({this.x, this.y, this.y1});
  final String? x;
  final double? y;
  final double? y1;
}

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData(x: 'Mo', y: 2, y1: 1.7),
  ChartColumnData(x: "Tu", y: 2, y1: 0.5),
  ChartColumnData(x: "We", y: 2, y1: 1.5),
  ChartColumnData(x: "Th", y: 2, y1: 0.8),
  ChartColumnData(x: "Fr", y: 2, y1: 1.3),
  ChartColumnData(x: "Sa", y: 2, y1: 1.8),
  ChartColumnData(x: "Su", y: 2, y1: 0.9),
];
