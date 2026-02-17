class TicketDetailsModel {
  TicketDetailsModel({
      this.id, 
      this.subject, 
      this.priority, 
      this.status, 
      this.orderId, 
      this.lastMessageAt, 
      this.createdAt, 
      this.messages,});

  TicketDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    subject = json['subject'];
    priority = json['priority'];
    status = json['status'];
    orderId = json['order_id'];
    lastMessageAt = json['last_message_at'];
    createdAt = json['created_at'];
    if (json['messages'] != null) {
      messages = [];
      json['messages'].forEach((v) {
        messages?.add(TicketMessages.fromJson(v));
      });
    }
  }
  num? id;
  String? subject;
  String? priority;
  String? status;
  num? orderId;
  String? lastMessageAt;
  String? createdAt;
  List<TicketMessages>? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subject'] = subject;
    map['priority'] = priority;
    map['status'] = status;
    map['order_id'] = orderId;
    map['last_message_at'] = lastMessageAt;
    map['created_at'] = createdAt;
    if (messages != null) {
      map['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TicketMessages {
  TicketMessages({
      this.id, 
      this.senderType, 
      this.message, 
      this.createdAt,});

  TicketMessages.fromJson(dynamic json) {
    id = json['id'];
    senderType = json['sender_type'];
    message = json['message'];
    createdAt = json['created_at'];
  }
  num? id;
  String? senderType;
  String? message;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sender_type'] = senderType;
    map['message'] = message;
    map['created_at'] = createdAt;
    return map;
  }

}