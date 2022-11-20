class States {
  String? id;
  String? name;
  String? countryId;
  String? status;

  States({this.id, this.name, this.countryId, this.status});

  States.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['country_id'] = countryId;
    data['status'] = status;
    return data;
  }
}
