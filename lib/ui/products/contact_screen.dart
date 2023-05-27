import 'package:flutter/material.dart';
import 'package:myproject/models/product.dart';
import '../shared/app_drawer.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact';

  ContactScreen(Product? product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mọi chi tiết xin liên hệ'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Thiendt20v7x081@dttx.ctu.edu.vn',
              style: const TextStyle(
                color: Colors.deepOrange,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text('Địa chỉ: TP Cao Lãnh - Đồng Tháp',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
