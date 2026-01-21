class Inbox {
  final String id;
  final String receiverId;
  final String senderId;
  final String senderName;
  final String senderEmail;
  final String subject;
  final String body;
  final bool read;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  Inbox({
    required this.id,
    required this.receiverId,
    required this.senderId,
    required this.senderName,
    required this.senderEmail,
    required this.subject,
    required this.body,
    required this.read,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Inbox.fromJson(Map<String, dynamic> json) {
    return Inbox(
      id: json['_id'] ?? json['id'],
      receiverId:
          json['recieverId'] ??
          json['receiverId'], // Backend might have a typo 'recieverId'
      senderId: json['senderId'],
      senderName: json['senderName'],
      senderEmail: json['senderEmail'],
      subject: json['subject'],
      body: json['body'],
      read: json['read'] ?? false,
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'receiverId': receiverId,
      'senderId': senderId,
      'senderName': senderName,
      'senderEmail': senderEmail,
      'subject': subject,
      'body': body,
      'read': read,
      'readAt': readAt?.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
