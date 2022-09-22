import 'package:slookyie_max/data/models/bookingModel.dart';

class UserViewBookingModel {
  UserViewBookingModel({
      this.status, 
      this.msg, 
      this.data, 
      this.data2,});

  UserViewBookingModel.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['data2'] != null) {
      data2 = [];
      json['data2'].forEach((v) {
        data2?.add(Data2.fromJson(v));
      });
    }
  }
  bool? status;
  String? msg;
  List<Data>? data;
  List<dynamic>? data2;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (data2 != null) {
      map['data2'] = data2?.map((v) => v.toJson()).toList();
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