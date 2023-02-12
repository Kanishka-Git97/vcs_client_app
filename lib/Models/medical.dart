class Medical {
  int? id;
  String? date;
  String? comment;
  int? pet;

  Medical({this.id, this.date, this.comment, this.pet});

  Medical.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    comment = json['comment'];
    pet = json['pet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['comment'] = this.comment;
    data['pet'] = this.pet;
    return data;
  }
}
