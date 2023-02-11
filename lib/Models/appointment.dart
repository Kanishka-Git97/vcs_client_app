class Appointment {
  int? id;
  String? date;
  String? time;
  String? type;
  String? status;
  int? doctor;
  int? client;
  int? clinic;
  String? remark;

  Appointment(
      {this.id,
      this.date,
      this.time,
      this.type,
      this.status,
      this.doctor,
      this.client,
      this.clinic,
      this.remark});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    time = json['time'];
    type = json['type'];
    status = json['status'];
    doctor = json['doctor'];
    client = json['client'];
    clinic = json['clinic'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['time'] = this.time;
    data['type'] = this.type;
    data['status'] = this.status;
    data['doctor'] = this.doctor;
    data['client'] = this.client;
    data['clinic'] = this.clinic;
    data['remark'] = this.remark;
    return data;
  }
}
