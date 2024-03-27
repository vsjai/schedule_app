import 'package:flutter/material.dart';
import 'package:schedule_app/app/models.dart';
import 'package:schedule_app/viewmodel/schedule_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../../app/constants.dart';
import 'custom_button.dart';

class UpdateSchedule extends StatelessWidget {
  final ScheduleModel model;
  UpdateSchedule({super.key, required this.model});
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final doctorNameController = TextEditingController();
  final emailController = TextEditingController();
  final formKeyUpdateSchedule = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      onViewModelReady: (viewModel) {
        dateController.text = model.date ?? "";
        timeController.text = model.time ?? "";
        doctorNameController.text = model.docName ?? "";
        emailController.text = model.emailCc ?? "";
        viewModel
            .updateOnlineMeeting((model.onlineMeeting == "1") ? true : false);
      },
      onDispose: (_) {
        dateController.dispose();
        timeController.dispose();
        doctorNameController.dispose();
        emailController.dispose();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: dateController,
                  decoration: getInputDecoration("Select A Date "),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: timeController,
                  decoration: getInputDecoration("Select A Time"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: doctorNameController,
                  decoration: getInputDecoration("Doctor Name"),
                ),
                const SizedBox(height: 10),
                InputDecorator(
                  decoration: getInputDecoration("Online Meeting")
                      .copyWith(isDense: true),
                  child: Row(
                    children: [
                      Switch(
                        value: viewModel.scheduleOnlineMeeting,
                        onChanged: (value) {
                          viewModel.updateOnlineMeeting(value);
                        },
                      ),
                      const Flexible(
                        child: Text(
                          "Schedule Online Meeting",
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: getInputDecoration("CC Email ID"),
                ),
                const SizedBox(height: 10),
                NormalCustomButton(
                  title: "Update Schedule",
                  onPressed: () {
                    viewModel.updateSchedule(
                        context,
                        doctorNameController.text,
                        emailController.text,
                        model.id.toString(),
                        dateController.text,
                        timeController.text);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
