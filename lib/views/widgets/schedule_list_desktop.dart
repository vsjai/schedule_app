import 'package:flutter/material.dart';
import 'package:schedule_app/app/constants.dart';
import 'package:schedule_app/app/models.dart';
import 'package:schedule_app/viewmodel/schedule_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../viewmodel/schedule_list_viewmodel.dart';

class UpcomingScheduleWidgetDesktop extends StatefulWidget {
  const UpcomingScheduleWidgetDesktop({super.key});

  @override
  State<UpcomingScheduleWidgetDesktop> createState() =>
      _UpcomingScheduleWidgetDesktopState();
}

class _UpcomingScheduleWidgetDesktopState
    extends State<UpcomingScheduleWidgetDesktop> {
  final ScrollController _scrollController = ScrollController();

  void scrollToPrevious() {
    _scrollController.animateTo(
      _scrollController.offset -
          MediaQuery.of(context).size.width / 2, // Adjust the offset as needed
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToNext() {
    _scrollController.animateTo(
      _scrollController.offset +
          MediaQuery.of(context).size.width / 2, // Adjust the offset as needed
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleListViewModel>.reactive(
      viewModelBuilder: () => ScheduleListViewModel(),
      builder: (context, viewModel, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        height: 300,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: viewModel.data
                              ?.map((e) => e.date)
                              .toSet()
                              .toList()
                              .length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var list = viewModel.data
                                    ?.map((e) => e.date)
                                    .toSet()
                                    .toList() ??
                                [];
                            return UpcomingSchedule(
                              list: (viewModel.data ?? [])
                                  .where((e) => e.date == list[index])
                                  .toList(),
                              date: list[index].toString(),
                              withExpanded: true,
                            );
                          },
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          label: const Text("Previous"),
                          onPressed: () {
                            scrollToPrevious();
                          },
                          icon: const Icon(Icons.arrow_back_ios_outlined)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                          label: const Text("Next"),
                          onPressed: () {
                            scrollToNext();
                          },
                          icon: const Icon(Icons.arrow_forward_ios_outlined)),
                    ),
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

class UpcomingSchedule extends ViewModelWidget<ScheduleListViewModel> {
  final String date;
  final double padding;
  final List<ScheduleModel> list;
  final bool withExpanded;
  const UpcomingSchedule({
    required this.date,
    this.padding = 18,
    required this.list,
    this.withExpanded = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, ScheduleListViewModel viewModel) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                convertDate(date),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              withExpanded
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return _MyRow(scheduleModel: list[index]);
                        },
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return _MyRow(scheduleModel: list[index]);
                      },
                    ),
            ]),
      ),
    );
  }
}

class _MyRow extends StatelessWidget {
  final ScheduleModel scheduleModel;
  const _MyRow({
    required this.scheduleModel,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (context, viewModel, child) {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(scheduleModel.time ?? ""),
              Column(
                children: [
                  Text(
                    scheduleModel.docName ?? "",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "(doctor)",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    onPressed: () {
                      viewModel.showUpdateDialog(context, scheduleModel);
                    },
                    icon: const Icon(Icons.edit_square)),
                IconButton(
                    onPressed: () {
                      viewModel.deleteSchedule(
                          int.parse(scheduleModel.id ?? ""), context);
                      viewModel.rebuildUi();
                    },
                    icon: const Icon(Icons.delete)),
              ])
            ]);
      },
    );
  }
}
