import 'package:flutter/material.dart';
import 'package:schedule_app/viewmodel/schedule_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'schedule_list_desktop.dart';

class ScheduleListWidgetMobile extends StatelessWidget {
  const ScheduleListWidgetMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleListViewModel>.reactive(
      viewModelBuilder: () => ScheduleListViewModel(),
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Upcoming Schedules",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      viewModel.refreshData();
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            (viewModel.isBusy)
                ? Center(child: const CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.data
                        ?.map((e) => e.date)
                        .toSet()
                        .toList()
                        .length,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var list =
                          viewModel.data?.map((e) => e.date).toSet().toList() ??
                              [];
                      return UpcomingSchedule(
                        padding: 5,
                        list: (viewModel.data ?? [])
                            .where((e) => e.date == list[index])
                            .toList(),
                        date: list[index].toString(),
                      );
                    },
                  )
          ],
        );
      },
    );
  }
}
