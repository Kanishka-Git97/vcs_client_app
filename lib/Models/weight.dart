class Weight {
  int? id;
  String? date;
  double? weight;
  int? pet;

  Weight({this.id, this.date, this.weight, this.pet});

  Weight.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    weight = json['weight'];
    pet = json['pet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['weight'] = this.weight;
    data['pet'] = this.pet;
    return data;
  }
}
