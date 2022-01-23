import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DetailScreen extends StatelessWidget {
  final String country;
  final String image;
  final double newCases;
  final double todayDeath;
  final double totalDeath;
  final double totalCases;
  final double active;
  final double recovered;

  DetailScreen(
      {Key? key,
      required this.country,
      required this.image,
      required this.newCases,
      required this.todayDeath,
      required this.totalDeath,
      required this.totalCases,
      required this.active,
      required this.recovered})
      : super(key: key);

  Map<String, double> data = {
    'New Cases': 40,
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
    const Color(0xFF1B5E20),
  ];

  Widget pieChart(BuildContext context) {
    return PieChart(
      dataMap: {
        'New Cases': newCases,
        'Total Cases': totalCases,
        'Active': active,
        'Today\'s Death': todayDeath,
        'Total Death': todayDeath,
        'Recovered': recovered,
      },
      chartType: ChartType.disc,
      chartLegendSpacing: 10,
      colorList: color,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(country),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: Hero(
                  tag: image, child: Image.network(image, fit: BoxFit.cover)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: pieChart(context),
            ),
          ],
        ),
      ),
    );
  }
}
