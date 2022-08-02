class DelStaffModel {
  DelStaffModel({
      this.status, 
      this.msg, 
      this.data,});

  DelStaffModel.fromJson(dynamic json) {
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
      this.staff, 
      this.role, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    staff = json['staff'];
    role = json['role'];
    v = json['__v'];
  }
  String? id;
  String? staff;
  String? role;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['staff'] = staff;
    map['role'] = role;
    map['__v'] = v;
    return map;
  }

}