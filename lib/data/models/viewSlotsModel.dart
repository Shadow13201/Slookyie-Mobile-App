class ViewSlotsModel {
  ViewSlotsModel({
      this.status, 
      this.msg, 
      this.data,});

  ViewSlotsModel.fromJson(dynamic json) {
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
      this.slot, 
      this.role, 
      this.v,});

  Data.fromJson(dynamic json) {
    id = json['_id'];
    slot = json['slot'];
    role = json['role'];
    v = json['__v'];
  }
  String? id;
  String? slot;
  String? role;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['slot'] = slot;
    map['role'] = role;
    map['__v'] = v;
    return map;
  }

}