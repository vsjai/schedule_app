// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:schedule_app/viewmodel/schedule_viewmodel.dart';
import 'package:stacked/stacked.dart';

import '../app/constants.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/schedule_list_desktop.dart';
import 'widgets/schedule_list_mobile.dart';
import 'widgets/custom_button.dart';

class DesktopScheduleScreen extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final doctorNameController = TextEditingController();
  final emailController = TextEditingController();

  DesktopScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Schedule View"),
            backgroundColor: const Color.fromARGB(255, 243, 246, 255),
          ),
          backgroundColor: const Color.fromARGB(255, 243, 246, 255),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Create New Schedule",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      CustomTextField(
                        controller: dateController,
                        hintText: "Select A Date",
                        readOnly: true,
                        onTap: () async {
                          var date = await viewModel.selectDate(context);
                          if (date != null) {
                            dateController.text = date;
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      CustomTextField(
                        controller: timeController,
                        hintText: "Select A Time",
                        readOnly: true,
                        onTap: () async {
                          var time = await viewModel.selectTime(context);
                          if (time != null) {
                            timeController.text = time;
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      CustomTextField(
                        controller: doctorNameController,
                        hintText: "Doctor Name",
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: InputDecorator(
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
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      CustomTextField(
                        controller: emailController,
                        hintText: "CC Email ID",
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: NormalCustomButton(
                          title: "Add Schedule",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              viewModel.createSchedule(
                                  context,
                                  doctorNameController.text,
                                  emailController.text,
                                  dateController.text,
                                  timeController.text);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const UpcomingScheduleWidgetDesktop()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MobileScheduleScreen extends StatelessWidget {
  MobileScheduleScreen({super.key});

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final doctorNameController = TextEditingController();
  final emailController = TextEditingController();
  static final GlobalKey<FormState> formKeyMobile = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduleViewModel>.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Schedule View"),
            backgroundColor: const Color.fromARGB(255, 243, 246, 255),
          ),
          backgroundColor: const Color.fromARGB(255, 243, 246, 255),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKeyMobile,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Create New Schedule",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: dateController,
                      onTap: () async {
                        var date = await viewModel.selectDate(context);
                        if (date != null) {
                          dateController.text = date;
                        }
                      },
                      decoration: getInputDecoration("Select A Date"),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      readOnly: true,
                      onTap: () async {
                        var time = await viewModel.selectTime(context);
                        timeController.text = time.toString();
                      },
                      controller: timeController,
                      decoration: getInputDecoration("Select A Time"),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: doctorNameController,
                      decoration: getInputDecoration("Doctor Name"),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: getInputDecoration("Email Cc"),
                    ),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(
                        child: InputDecorator(
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
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 10),
                    NormalCustomButton(
                      title: "Add Schedule",
                      onPressed: () {
                        viewModel.createSchedule(
                            context,
                            doctorNameController.text,
                            emailController.text,
                            dateController.text,
                            timeController.text);
                      },
                    ),
                    const SizedBox(width: 10),
                    const ScheduleListWidgetMobile()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
