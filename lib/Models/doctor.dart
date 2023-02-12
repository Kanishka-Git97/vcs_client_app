class Doctor {
  int? id;
  String? firstName;
  String? lastName;
  String? nic;
  String? email;
  String? address;
  String? mobile;
  String? title;
  double? physicalFee;
  double? onlineFee;
  String? status;
  String? img;

  Doctor(
      {this.id,
      this.firstName,
      this.lastName,
      this.nic,
      this.email,
      this.address,
      this.mobile,
      this.title,
      this.physicalFee,
      this.onlineFee,
      this.status,
      this.img});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    nic = json['nic'];
    email = json['email'];
    address = json['address'];
    mobile = json['mobile'];
    title = json['title'];
    physicalFee = json['physicalFee'];
    onlineFee = json['onlineFee'];
    status = json['status'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['nic'] = this.nic;
    data['email'] = this.email;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['title'] = this.title;
    data['physicalFee'] = this.physicalFee;
    data['onlineFee'] = this.onlineFee;
    data['status'] = this.status;
    data['img'] = this.img;
    return data;
  }
}
