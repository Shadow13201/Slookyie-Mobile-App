class DeleteBookingModel {
  DeleteBookingModel({
      this.status, 
      this.msg, 
      this.data,});

  DeleteBookingModel.fromJson(dynamic json) {
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
      this.id, 
      this.role, 
      this.userId, 
      this.serviceId, 
      this.date, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    role = json['role'];
    userId = json['UserId'];
    serviceId = json['serviceId'];
    date = json['date'];
    v = json['__v'];
  }
  String? id;
  String? role;
  String? userId;
  String? serviceId;
  String? date;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['role'] = role;
    map['UserId'] = userId;
    map['serviceId'] = serviceId;
    map['date'] = date;
    map['__v'] = v;
    return map;
  }

}