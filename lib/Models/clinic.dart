class Clinic {
  int? id;
  String? name;
  String? address;
  String? reg;
  double? longitude;
  double? latitude;
  int? doctor;

  Clinic(
      {this.id,
      this.name,
      this.address,
      this.reg,
      this.longitude,
      this.latitude,
      this.doctor});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    reg = json['reg'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    doctor = json['doctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['reg'] = this.reg;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['doctor'] = this.doctor;
    return data;
  }
}
