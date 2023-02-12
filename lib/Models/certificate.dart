class Certificate {
  int? id;
  int? doctor;
  int? client;
  int? pet;
  String? date;
  String? status;

  Certificate(
      {this.id, this.doctor, this.client, this.pet, this.date, this.status});

  Certificate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctor = json['doctor'];
    client = json['client'];
    pet = json['pet'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor'] = this.doctor;
    data['client'] = this.client;
    data['pet'] = this.pet;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}
