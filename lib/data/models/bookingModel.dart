class BookingModel {
  BookingModel({
      this.status, 
      this.msg, 
      this.data, 
      this.data2,});

  BookingModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    data2 = json['data2'] != null ? Data2.fromJson(json['data2']) : null;
  }
  bool? status;
  String? msg;
  Data? data;
  Data2? data2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (data2 != null) {
      map['data2'] = data2?.toJson();
    }
    return map;
  }

}

class Data2 {
  Data2({
      this.role, 
      this.id, 
      this.v,});

  Data2.fromJson(dynamic json) {
    role = json['role'];
    id = json['_id'];
    v = json['__v'];
  }
  String? role;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}

class Data {
  Data({
      this.role, 
      this.id, 
      this.userId, 
      this.serviceId, 
      this.date, 
      this.v,});

  Data.fromJson(dynamic json) {
    role = json['role'];
    id = json['_id'];
    userId = json['UserId'];
    serviceId = json['serviceId'];
    date = json['date'];
    v = json['__v'];
  }
  String? role;
  String? id;
  String? userId;
  String? serviceId;
  String? date;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['_id'] = id;
    map['UserId'] = userId;
    map['serviceId'] = serviceId;
    map['date'] = date;
    map['__v'] = v;
    return map;
  }

}