// ignore_for_file: dead_code

import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:schedule_app/viewmodel/activity_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActivityViewModel>.nonReactive(
      viewModelBuilder: () => ActivityViewModel(),
      onViewModelReady: (viewModel) => viewModel.generateRandomNumbers(),
      builder: (context, viewModel, child) {
        return Scaffold(
            backgroundColor: const Color.fromARGB(255, 243, 246, 255),
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 243, 246, 255),
              title: const Text("Activity Screen"),
            ),
            body: SingleChildScrollView(
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  CustomChart(
                    title: "Mind",
                    percent: viewModel.mindPercent,
                    color: Colors.blue,
                    onTap: () {},
                  ),
                  CustomChart(
                    title: "Body",
                    color: Colors.red,
                    percent: viewModel.bodyPercent,
                  ),
                  CustomChart(
                    title: "Money",
                    percent: viewModel.moneyPercent,
                    color: Colors.green,
                  ),
                  CustomChart(
                    title: "Tribe",
                    percent: viewModel.tribePercent,
                    color: Colors.cyan,
                  ),
                  CustomChart(
                    title: "World",
                    percent: viewModel.worldPercent,
                    color: Colors.brown,
                  )
                ],
              ),
            ));
      },
    );
  }
}

class CustomChart extends ViewModelWidget<ActivityViewModel> {
  final String title;
  final Color color;
  final double percent;
  final VoidCallback? onTap;
  CustomChart({
    required this.title,
    this.onTap,
    required this.percent,
    this.color = Colors.red,
    super.key,
  });
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();

  @override
  Widget build(BuildContext context, ActivityViewModel viewModel) {
    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(
        <CircularSegmentEntry>[
          CircularSegmentEntry(percent, color),
          CircularSegmentEntry(100 - percent, Colors.grey.shade300),
        ],
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedCircularChart(
          key: _chartKey,
          size: Size(
              (MediaQuery.of(context).size.width > 600)
                  ? 300.0
                  : MediaQuery.of(context).size.width,
              300.0),
          initialChartData: data,
          holeLabel: "$percent%",
          percentageValues: true,
          holeRadius: 50,
          duration: const Duration(milliseconds: 1000),
          chartType: CircularChartType.Radial,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        )
      ],
    );
  }
}
