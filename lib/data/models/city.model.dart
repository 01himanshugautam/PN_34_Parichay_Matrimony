class Cities {
  String? id;
  String? name;
  String? stateId;
  String? cost;
  String? status;

  Cities({this.id, this.name, this.stateId, this.cost, this.status});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    cost = json['cost'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['state_id'] = stateId;
    data['cost'] = cost;
    data['status'] = status;
    return data;
  }
}
