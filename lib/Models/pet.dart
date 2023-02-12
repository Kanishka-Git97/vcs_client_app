class Pet {
  int? id;
  String? name;
  String? breed;
  String? type;
  String? sex;
  String? dob;
  String? specialRemarks;
  int? doctor;
  int? client;
  String? img;

  Pet(
      {this.id,
      this.name,
      this.breed,
      this.type,
      this.sex,
      this.dob,
      this.specialRemarks,
      this.doctor,
      this.client,
      this.img});

  Pet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    breed = json['breed'];
    type = json['type'];
    sex = json['sex'];
    dob = json['dob'];
    specialRemarks = json['specialRemarks'];
    doctor = json['doctor'];
    client = json['client'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['breed'] = this.breed;
    data['type'] = this.type;
    data['sex'] = this.sex;
    data['dob'] = this.dob;
    data['specialRemarks'] = this.specialRemarks;
    data['doctor'] = this.doctor;
    data['client'] = this.client;
    data['img'] = this.img;
    return data;
  }
}
