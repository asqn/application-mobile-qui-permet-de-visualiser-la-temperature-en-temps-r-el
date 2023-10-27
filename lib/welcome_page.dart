import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:loginpage/auth_controller.dart';

class WelcomePage extends StatefulWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  final StreamController<LiveData> _localStreamController = StreamController<LiveData>();

  @override
  void initState() {
    chartData = getChartData();

    _localStreamController.stream.listen((data) {
      chartData.add(data);
      chartData.removeAt(0);
      _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1,
        removedDataIndex: 0,
      );
      if (data.temperature > 100) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Attention! La température est plus de 100!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });

    int currentTime = 0;
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      // Generate random temperature for the demonstration
      num randomTemperature = 20 + (30 - 20) * (DateTime.now().millisecondsSinceEpoch % 100) / 100;
      if (currentTime == 10) {
        randomTemperature = 101;
      }

      // Add new LiveData instance to the stream
      _localStreamController.add(LiveData(currentTime, randomTemperature));

      // Update current time
      currentTime++;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "Temp Solutions",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.email,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SfCartesianChart(
                series: <LineSeries<LiveData, int>>[
                  LineSeries<LiveData, int>(
                    onRendererCreated: (ChartSeriesController controller) {
                      _chartSeriesController = controller;
                    },
                    dataSource: chartData,
                    color: const Color.fromRGBO(192, 108, 132, 1),
                    xValueMapper: (LiveData data, _) => data.time,
                    yValueMapper: (LiveData data, _) => data.temperature,
                  )
                ],
                primaryXAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  interval: 3,
                  title: AxisTitle(text: 'Time (seconds)'),
                ),
                primaryYAxis: NumericAxis(
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                  title: AxisTitle(text: 'Température (°C)'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.logOut();
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage("img/téléchargement (2).jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Sign out",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 42),
      LiveData(1, 47),
      LiveData(2, 43),
      LiveData(3, 49),
      LiveData(4, 54),
      LiveData(5, 41),
      LiveData(6, 58),
      LiveData(7, 51),
      LiveData(8, 98),
      LiveData(9, 41),
      LiveData(10, 53),
      LiveData(11, 72),
      LiveData(12, 86),
      LiveData(13, 52),
      LiveData(14, 94),
      LiveData(15, 92),
      LiveData(16, 86),
      LiveData(17, 72),
      LiveData(18, 94),
    ];
  }
}

class LiveData {
  LiveData(this.time, this.temperature);
  final int time;
  final num temperature;
}
