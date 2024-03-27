//
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedule_app/app/models.dart';

class ApiService {
  Future<List<ScheduleModel>?> getScheduleList() async {
    try {
      var url = Uri.parse(
          "https://showdigital.in/flutter-schedules/list_schedule.php");
      var res = await http.get(url);
      var jsonDecoded = json.decode(res.body);
      var list =
          (jsonDecoded as List).map((e) => ScheduleModel.fromJson(e)).toList();
      return list;
    } catch (e) {
      return null;
    }
  }

  Future<bool> createSchedule(Map<String, dynamic> jsonData) async {
    try {
      var url = Uri.parse(
          "https://showdigital.in/flutter-schedules/create_schedule.php");
      var res = await http.post(url, body: json.encode(jsonData));
      if (res.body.contains("error")) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateSchedule(ScheduleModel model) async {
    try {
      var url = Uri.parse(
          "https://showdigital.in/flutter-schedules/update_schedule.php");
      var res = await http.put(url, body: json.encode(model.toJson()));
      if (res.body.contains("error")) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteSchedule(int id) async {
    try {
      var url = Uri.parse(
          "https://showdigital.in/flutter-schedules/delete_schedule.php?id=$id");
      var res = await http.delete(url);
      if (res.body.contains("error")) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
