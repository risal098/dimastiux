import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../bar_items/bardata.dart';
import '../controllers/accountData.dart';
class MyBarData extends StatelessWidget {
  final List weeklySum;
  const MyBarData({super.key, required this.weeklySum});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var data=AccountData.weeklyStat!;
    print(data);
    print(data["Monday"]+1);
    var myBardata = BarData(
        sun: double.parse(data["Sunday"].toString()),
        mon: double.parse(data["Monday"].toString()),
        tue: double.parse(data["Tuesday"].toString()),
        wed: double.parse(data["Wednesday"].toString()),
        thu: double.parse(data["Thursday"].toString()),
        fri: double.parse(data["Friday"].toString()),
        sat: double.parse(data["Saturday"].toString())
    );
    myBardata.initilizedBarData();

    return BarChart(BarChartData(
      maxY: 60,
      minY: 0,
      gridData: FlGridData(
        checkToShowVerticalLine: (value) => false,
      ),
      borderData: FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            width: 1,
          ),
          left: BorderSide(
            width: 1,
          ),
        ),
      ),
      titlesData: FlTitlesData(
          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          )),
      barGroups: myBardata.bars
          .map((data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Color.fromARGB(255, 8, 43, 95),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7)),
                  width: width * 25 / 360,
                ),
              ]))
          .toList(),
    ));
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'sun';
          break;
        case 1:
          text = 'mon';
          break;
        case 2:
          text = 'tue';
          break;
        case 3:
          text = 'wed';
          break;
        case 4:
          text = 'thu';
          break;
        case 5:
          text = 'fri';
          break;
        case 6:
          text = 'sat';
          break;
      }

      return Text(text, style: TextStyle(fontSize: 14),);
    });
}

class UserChart extends StatefulWidget {
  const UserChart({super.key});

  @override
  State<UserChart> createState() => _UserChartState();
}

class _UserChartState extends State<UserChart> {
  static List<double> chartData = [
    45.0,
    15.0,
    17.0,
    13.0,
    27.0,
    8.0,
    12.0,
  ];
  double maxData = 27.0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SizedBox(
        height: 190,
        child: MyBarData(
          weeklySum: chartData,
        ));
  }
}
