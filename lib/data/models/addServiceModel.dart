class AddServiceModel {
  AddServiceModel({
      this.status, 
      this.msg, 
      this.data,});

  AddServiceModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.service, 
      this.cost, 
      this.role, 
      this.id, 
      this.v,});

  Data.fromJson(dynamic json) {
    service = json['service'];
    cost = json['cost'];
    role = json['role'];
    id = json['_id'];
    v = json['__v'];
  }
  String? service;
  int? cost;
  String? role;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['service'] = service;
    map['cost'] = cost;
    map['role'] = role;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}