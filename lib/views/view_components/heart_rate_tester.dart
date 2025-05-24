import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ui_helper/color.dart';

class StaticHeartRateChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> beat = [72, 74, 76, 75, 78, 77, 76, 80, 82, 78];
    int bpmCalculation(List<int> beat) {
      int sum = beat.fold(0, (a, b) => a + b);
      int numberOfBeats = beat.length;
      int bpm = sum ~/ numberOfBeats;
      return bpm;
    }


    return Scaffold(
      appBar: AppBar(title: Text('Static Heart Rate Line')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  minY: 60,
                  maxY: 100,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) => Text(
                          '${value.toInt()}s',
                          style: TextStyle(fontSize: 10, color: Colors.red),
                        ),
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        getTitlesWidget: (value, meta) => Text(
                          '${value.toInt()}',
                          style: TextStyle(fontSize: 10, color: Colors.red),
                        ),
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    horizontalInterval: 5,
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: beat
                          .asMap()
                          .entries
                          .map((e) => FlSpot(
                          e.key.toDouble(), e.value.toDouble()))
                          .toList(),
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),

            Container(
              height: 200,
              width: 200,

              decoration: BoxDecoration(
                borderRadius:  BorderRadius.circular(100),
                color:AppColors.lightRed,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightRed.withOpacity(0.5),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BPM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    bpmCalculation(beat).toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
