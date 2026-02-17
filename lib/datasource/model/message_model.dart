class MessageModel {
  int? id;
  int? patientRideOrderId;
  int? patientRiderId;
  int? userId;
  String? message;
  String? sender;
  String? createdAt;
  String? updatedAt;

  MessageModel({this.id, this.patientRideOrderId, this.patientRiderId, this.userId, this.message, this.sender, this.createdAt, this.updatedAt});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientRideOrderId = json['patient_ride_order_id'];
    patientRiderId = json['patient_rider_id'];
    userId = json['user_id'];
    message = json['message'];
    sender = json['sender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_ride_order_id'] = patientRideOrderId;
    data['patient_rider_id'] = patientRiderId;
    data['user_id'] = userId;
    data['message'] = message;
    data['sender'] = sender;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
