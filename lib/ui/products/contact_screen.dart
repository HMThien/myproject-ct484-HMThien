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
        title: const Text('Mọi chi tiết xin liên hệ'),
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
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 300,
              width: double.infinity,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Thiendt20v7x081@dttx.ctu.edu.vn',
              style: TextStyle(
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
              child: const Text('Địa chỉ: TP Cao Lãnh - Đồng Tháp',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 20,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
