// ignore_for_file: unused_local_variable

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../models/product.dart';
import 'notifications_detail_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  BuildContext get context {
    throw UnimplementedError();
  }

  /*static const routeName = '/notifications';

  const NotificationsScreen(
    this.product, {
    super.key,
    required IconButton IconButton,
  });

  final Product product;


 ListView(
  children: ListTile.divideTiles(context: context, tiles: [
    ListTile(
      leading: Icon(Icons.car_rental),
      title: Text('Car'),
    ),
    ListTile(
      leading: Icon(Icons.flight),
      title: Text('Flight'),
    ),
    ListTile(
      leading: Icon(Icons.train),
      title: Text('Train'),
    ),
  ]).toList(),
)
*/

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _items = Item.loadItems(20);
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
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            return ListTile(
              leading: const Icon(Icons.message_rounded),
              title: const Text('Thông báo update tài khoản'),
              // ignore: unnecessary_const
              // trailing: ,
              //IconButton(icon: const Icons.more_horiz)
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    buttonDetailNotification(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget buttonDetailNotification() {
    return IconButton.outlined(
      icon: const Icon(Icons.more_horiz),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const NotificationsDetailScreen();
        }));
      },
    );
  }
}

/*class Product {
  final String des;
  Product({required this.des});

  Product copyWith({
    String? des,
  }) {
    return Product(
      des: des ?? this.des,
    );
  }
}*/

class Item {
  final String des;

  Item(this.des);
  static List<Item> loadItems(int itemCount) {
    return List.generate(itemCount, (index) {
      return Item('Thông báo $index');
    });
  }

  /* List<Product> _items = [
    Product(
      des: 'fgdf a jholh oh oh oh oih oh ois ',
    ),
  ];*/
}
