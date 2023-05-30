import 'package:flutter/material.dart';

import '../../models/product.dart';
import 'notifications_screen.dart ';
import '../../models/notification.dart';

class NotificationsDetailScreen extends StatelessWidget {
  const NotificationsDetailScreen({
    super.key,
    required this.noti,
  });

  final Noti noti;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //         title: Text(noti.title),
          flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 0, 255, 106).withOpacity(0.5),
              const Color.fromARGB(255, 54, 255, 154).withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0, 1], //vi tri ti le mau từ 0 - 100%
          ),
        ),
      )),
      body: const Center(
        child: Text('atrogha adfbab dbafdb'),
      ),
    );
  }
}
