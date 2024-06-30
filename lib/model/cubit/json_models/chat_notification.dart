class ChatNotification {
  bool? status;
  Data? data;

  ChatNotification({this.status, this.data});

  ChatNotification.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? compId;
  String? compName;
  String? userName;
  String? lastMassage;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.compId,
      this.compName,
      this.userName,
      this.lastMassage,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    compId = json['comp_id'];
    compName = json['comp_name'];
    userName = json['user_name'];
    lastMassage = json['last_massage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['comp_id'] = this.compId;
    data['comp_name'] = this.compName;
    data['user_name'] = this.userName;
    data['last_massage'] = this.lastMassage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
