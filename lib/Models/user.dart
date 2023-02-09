class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? address;
  String? email;
  String? mobile;
  double? longitude;
  double? latitude;
  String? registerVia;
  int? referral;
  int? user;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.address,
      this.email,
      this.mobile,
      this.longitude,
      this.latitude,
      this.registerVia,
      this.referral,
      this.user});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    address = json['address'];
    email = json['email'];
    mobile = json['mobile'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    registerVia = json['registerVia'];
    referral = json['referral'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['address'] = this.address;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['registerVia'] = this.registerVia;
    data['referral'] = this.referral;
    data['user'] = this.user;
    return data;
  }
}
