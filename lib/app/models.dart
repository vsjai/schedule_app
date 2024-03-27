class ScheduleModel {
  String? id;
  String? date;
  String? time;
  String? docName;
  String? onlineMeeting;
  String? emailCc;

  ScheduleModel(
      {this.id,
      this.date,
      this.time,
      this.docName,
      this.onlineMeeting,
      this.emailCc});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    date = json["date"];
    time = json["time"];
    docName = json["doc_name"];
    onlineMeeting = json["online_meeting"];
    emailCc = json["email_cc"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["date"] = date;
    data["time"] = time;
    data["doc_name"] = docName;
    data["online_meeting"] = onlineMeeting;
    data["email_cc"] = emailCc;
    return data;
  }
}
