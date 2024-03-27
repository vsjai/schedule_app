// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:schedule_app/app/utils.dart';
import 'package:schedule_app/service/api_service.dart';

import 'package:stacked/stacked.dart';

import '../app/models.dart';
import '../views/widgets/update_schedule.dart';

class ScheduleViewModel extends BaseViewModel {
  bool _scheduleOnlineMeeting = false;
  bool get scheduleOnlineMeeting => _scheduleOnlineMeeting;

  Future<String?> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    return (pickedTime != null) ? pickedTime.format(context) : null;
  }

  TimeOfDay parseTimeOfDay(String timeString) {
    List<String> parts = timeString.split(' ');
    List<int> hourMinute = parts[0].split(':').map(int.parse).toList();

    if (parts[1] == 'PM' && hourMinute[0] < 12) {
      hourMinute[0] += 12;
    } else if (parts[1] == 'AM' && hourMinute[0] == 12) {
      hourMinute[0] = 0;
    }

    return TimeOfDay(hour: hourMinute[0], minute: hourMinute[1]);
  }

  Future<String?> selectDate(BuildContext context) async {
    final DateTime? pickedTime = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2030));
    var formattedTime = pickedTime?.toLocal().toString().split(' ')[0];
    return formattedTime;
  }

  deleteSchedule(int id, BuildContext context) async {
    var res = await ApiService().deleteSchedule(id);
    if (res) {
      Utils.showSnackBar(context, "Record deleted successfully", Colors.green);
      updateOnlineMeeting(scheduleOnlineMeeting);
    } else {
      Utils.showSnackBar(context, "Something went wrong", Colors.red);
    }
  }

  createSchedule(BuildContext context, String docName, String emailCc,
      String date, String time) async {
    Map<String, dynamic> json = {
      "date": date,
      "time": time,
      "doc_name": docName,
      "online_meeting": scheduleOnlineMeeting ? "1" : " 0",
      "email_cc": emailCc
    };

    var res = await ApiService().createSchedule(json);
    if (res && context.mounted) {
      Utils.showSnackBar(
          context, "New record created successfully", Colors.green);
      notifyListeners();
    } else {
      Utils.showSnackBar(context, "Something went wrong", Colors.red);
    }
  }

  showUpdateDialog(BuildContext context, ScheduleModel model) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Update Schedule",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel))
            ],
          ),
          content: SizedBox(
            height: 500,
            child: UpdateSchedule(
              model: model,
            ),
          ),
        );
      },
    );
  }

  updateSchedule(BuildContext context, String docName, String emailCc,
      String id, String date, String time) async {
    ScheduleModel newModel = ScheduleModel(
        id: id,
        date: date,
        time: time,
        docName: docName,
        onlineMeeting: scheduleOnlineMeeting ? "1" : " 0",
        emailCc: emailCc);
    var res = await ApiService().updateSchedule(newModel);
    if (res && context.mounted) {
      Navigator.pop(context);
      Utils.showSnackBar(context, "Record updated successfully", Colors.green);
      notifyListeners();
    } else {
      Navigator.pop(context);
      Utils.showSnackBar(context, "Something went wrong", Colors.red);
    }
  }

  updateOnlineMeeting(bool val) {
    _scheduleOnlineMeeting = val;
    notifyListeners();
  }
}
