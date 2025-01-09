import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class XPChart extends StatelessWidget {
  final List<FlSpot> spots = [
    FlSpot(0, 600), // Mon
    FlSpot(1, 500), // Tue
    FlSpot(2, 750), // Wed
    FlSpot(3, 900), // Thu
    FlSpot(4, 600), // Fri
    FlSpot(5, 400), // Sat
    FlSpot(6, 900), // Sun
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const titles = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  return Text(
                    titles[value.toInt()],
                    style: TextStyle(color: Color(0xFFB9B9BA), fontSize: 12),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 200,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(color: Color(0xFFB9B9BA), fontSize: 12),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(drawBelowEverything: false),
            rightTitles: AxisTitles(drawBelowEverything: false),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 1000,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Color(0xFF6949FF),
              barWidth: 3,
              curveSmoothness: 0.4,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Color(0xFF6949FF).withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}