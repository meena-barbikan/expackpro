import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Exflchart extends StatefulWidget {
  const Exflchart({super.key});

  @override
  State<Exflchart> createState() => _ExflchartState();
}

class _ExflchartState extends State<Exflchart> {
  int IsTouchedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pie Chart"),
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: PieChart(
              PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 0,
                  sections: buildData(),
                  pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        IsTouchedIndex = -1;
                        return;
                      }
                      IsTouchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  })),
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> buildData() {
    List<Color> sectionsColor = [
      Colors.red,
      Colors.blue,
      Colors.amberAccent,
      Colors.greenAccent,
    ];
    return List.generate(4, (i) {
      final Istouched = i == IsTouchedIndex;
      double radius = Istouched ? 150 : 100;
      double value = (i + 1) * 10;
      return PieChartSectionData(
          color: sectionsColor[i],
          value: value,
          radius: radius,
          titleStyle: TextStyle(fontSize: Istouched ? 23 : 16),
          badgeWidget: const CircleAvatar(
            radius: 20,
            child: Center(child: FaIcon(FontAwesomeIcons.cartArrowDown)),
          ),
          badgePositionPercentageOffset: 0.98);
    });
  }
}

class Barchat extends StatefulWidget {
  const Barchat({super.key});

  @override
  State<Barchat> createState() => _BarchatState();
}

class _BarchatState extends State<Barchat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            maxY: 50,
            titlesData: const FlTitlesData(
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            gridData: const FlGridData(show: false),
            barGroups: [
              BarChartGroupData(
                  x: 0, barRods: [BarChartRodData(toY: 8, color: Colors.blue)]),
              BarChartGroupData(
                  x: 1, barRods: [BarChartRodData(toY: 6, color: Colors.blue)]),
              BarChartGroupData(
                  x: 2, barRods: [BarChartRodData(toY: 7, color: Colors.blue)]),
              BarChartGroupData(
                  x: 3, barRods: [BarChartRodData(toY: 5, color: Colors.blue)]),
              BarChartGroupData(
                  x: 4, barRods: [BarChartRodData(toY: 3, color: Colors.blue)]),
            ],
          ),
        ),
      ),
    );
  }
}

class lineChart extends StatefulWidget {
  const lineChart({super.key});

  @override
  State<lineChart> createState() => _lineChartState();
}

class _lineChartState extends State<lineChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(show: true),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: [
                  FlSpot(0, 1),
                  FlSpot(1, 2),
                  FlSpot(2, 1.5),
                  FlSpot(3, 4),
                  FlSpot(4, 2),
                ],
                isCurved: true,
                color: Colors.blue,
                barWidth: 4,
                belowBarData: BarAreaData(
                    show: true, color: Colors.blue.withOpacity(0.3)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
