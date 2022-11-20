class Countries {
  String? id;
  String? code;
  String? name;
  String? status;

  Countries({this.id, this.code, this.name, this.status});

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
