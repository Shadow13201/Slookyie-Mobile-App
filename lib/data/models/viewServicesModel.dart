class ViewServicesModel {
  ViewServicesModel({
      this.status, 
      this.msg, 
      this.data,});

  ViewServicesModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.service, 
      this.role, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    service = json['service'];
    role = json['role'];
    v = json['__v'];
  }
  String? id;
  String? service;
  String? role;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['service'] = service;
    map['role'] = role;
    map['__v'] = v;
    return map;
  }

}