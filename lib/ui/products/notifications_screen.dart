import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../models/product.dart';
import 'notifications_detail_screen.dart';
import '../../models/notification.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final Future<List<Item>> itemsFuture = Item.loadItems(20);
    final List<Noti> items = Noti.notification;
    return Scaffold(
        appBar: AppBar(
            title: const Text('Thông báo'),
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
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                // elevation: 5.0,
                child: ListTile(
                  leading: const Icon(Icons.message_rounded),
                  title: Text(item.title_noti),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            buttonDetailNotification(noti: item),
                      ),
                    );
                  },
                  subtitle: Text(item.header_noti),
                  trailing: const Icon(Icons.more_horiz),
                ),
              );
            }));
  }
}

// ignore: camel_case_types
class buttonDetailNotification extends StatelessWidget {
  const buttonDetailNotification({super.key, required this.noti});

  final Noti noti;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(noti.title_noti),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(noti.full_noti),
      ),
    );
  }
}
