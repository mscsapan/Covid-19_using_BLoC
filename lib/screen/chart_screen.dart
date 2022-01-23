import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChartScreen extends StatelessWidget {
/*   final double newCases;
  final double totalCases;
  final double active;
  final double todayDeath;
  final double totalDeath;
  final double recovered;

  ChartScreen(
      {Key? key, required this.newCases,
      required this.todayDeath,
      required this.totalDeath,
      required this.totalCases,
      required this.active,
      required this.recovered}) : super(key: key);*/

  Map<String, double> data = {
    'New Cases': 10,
    'Total Cases': 30,
    'Active': 30,
    'Today\'s Death': 20,
    'Total Death': 6,
    'Recovered': 12,
  };

  final List<Color> color = [
    const Color(0xFF27045B),
    const Color(0xFF9852F9),
    const Color(0xFF6807F9),
    const Color(0xFFE33E5A),
    const Color(0xFFFFD739),
    const Color(0xFF29DE92),
  ];

  ChartScreen({Key? key}) : super(key: key);

  Widget pieChart(BuildContext context) {
    return PieChart(
      dataMap: data,
      chartType: ChartType.disc,
      chartLegendSpacing: 10,
      colorList: color,
      chartRadius: MediaQuery.of(context).size.width / 2.0,
      centerText: 'Update',
      chartValuesOptions: const ChartValuesOptions(
        chartValueBackgroundColor: Colors.redAccent,
        chartValueStyle: TextStyle(color: Colors.white70),
      ),
      animationDuration: const Duration(seconds: 1),
      legendOptions: const LegendOptions(
        showLegends: true,
        legendPosition: LegendPosition.right,
        showLegendsInRow: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: pieChart(context),
    );
  }
}
