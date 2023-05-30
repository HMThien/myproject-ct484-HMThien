import 'package:flutter/foundation.dart';

class Notifications {
  final String title_noti;
  final String header_noti;
  final String full_noti;

  Notifications({
    required this.title_noti,
    required this.header_noti,
    required this.full_noti,
  });

  factory Notifications.Json(Map<String, dynamic> json) {
    return Notifications(
      title_noti: json['title_noti'] as String,
      header_noti: json['header_noti'] as String,
      full_noti: json['full_noti'] as String,
    );
  }
}
