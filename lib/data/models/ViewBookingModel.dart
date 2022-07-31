class ViewBookingModel {
  ViewBookingModel({
      this.status, 
      this.msg, 
      this.data,});

  ViewBookingModel.fromJson(dynamic json) {
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
      this.time, 
      this.id, 
      this.role, 
      this.serviceId, 
      this.date, 
      this.v,});

  Data.fromJson(dynamic json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    id = json['_id'];
    role = json['role'];
    serviceId = json['serviceId'];
    date = json['date'];
    v = json['__v'];
  }
  Time? time;
  String? id;
  String? role;
  String? serviceId;
  String? date;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (time != null) {
      map['time'] = time?.toJson();
    }
    map['_id'] = id;
    map['role'] = role;
    map['serviceId'] = serviceId;
    map['date'] = date;
    map['__v'] = v;
    return map;
  }

}

class Time {
  Time({
      this.start, 
      this.end,});

  Time.fromJson(dynamic json) {
    start = json['start'];
    end = json['end'];
  }
  String? start;
  String? end;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['start'] = start;
    map['end'] = end;
    return map;
  }

}