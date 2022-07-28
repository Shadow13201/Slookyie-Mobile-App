class BookingModel {
  BookingModel({
      this.status, 
      this.msg, 
      this.data,});

  BookingModel.fromJson(dynamic json) {
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
      this.time, 
      this.id, 
      this.serviceId, 
      this.date, 
      this.v,});

  Data.fromJson(dynamic json) {
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
    id = json['_id'];
    serviceId = json['serviceId'];
    date = json['date'];
    v = json['__v'];
  }
  Time? time;
  String? id;
  String? serviceId;
  String? date;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (time != null) {
      map['time'] = time?.toJson();
    }
    map['_id'] = id;
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