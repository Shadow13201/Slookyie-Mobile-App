class AddStaffModel {
  AddStaffModel({
      this.status, 
      this.msg, 
      this.data,});

  AddStaffModel.fromJson(dynamic json) {
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
      this.staff, 
      this.role, 
      this.id, 
      this.v,});

  Data.fromJson(dynamic json) {
    staff = json['staff'];
    role = json['role'];
    id = json['_id'];
    v = json['__v'];
  }
  String? staff;
  String? role;
  String? id;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staff'] = staff;
    map['role'] = role;
    map['_id'] = id;
    map['__v'] = v;
    return map;
  }

}