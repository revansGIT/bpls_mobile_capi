class TicketModel {
  TicketModel({this.id, this.subject, this.priority, this.status, this.orderId, this.lastMessageAt, this.createdAt});

  TicketModel.fromJson(dynamic json) {
    id = json['id'];
    subject = json['subject'];
    priority = json['priority'];
    status = json['status'];
    orderId = json['order_id'];
    lastMessageAt = json['last_message_at'];
    createdAt = json['created_at'];
  }

  num? id;
  String? subject;
  String? priority;
  String? status;
  num? orderId;
  String? lastMessageAt;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subject'] = subject;
    map['priority'] = priority;
    map['status'] = status;
    map['order_id'] = orderId;
    map['last_message_at'] = lastMessageAt;
    map['created_at'] = createdAt;
    return map;
  }
}
