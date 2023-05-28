import 'package:flutter/material.dart';

import '../../models/product.dart';

class NotificationsDetailScreen extends StatelessWidget {
  const NotificationsDetailScreen({super.key});

  /* static const routeName = '/notification-detail';

  const NotificationsDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Thông báo update TK'),
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
              'Thông tin tài khoản',
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
              child: const Text(
                'Tài khoản bãn cần nhập mật khẩu',
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
