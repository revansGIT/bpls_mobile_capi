class UserModel {
  UserModel({this.id, this.deviceId, this.email, this.userType, this.appVersion, this.serverTime});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    deviceId = json['deviceId'];
    email = json['email'];
    userType = json['user_type'];
    appVersion = json['appVersion'];
    serverTime = json['serverTime'];
  }

  num? id;
  String? deviceId;
  String? email;
  String? userType;
  String? appVersion;
  String? serverTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['deviceId'] = deviceId;
    map['email'] = email;
    map['user_type'] = userType;
    map['appVersion'] = appVersion;
    map['serverTime'] = serverTime;
    return map;
  }
}
