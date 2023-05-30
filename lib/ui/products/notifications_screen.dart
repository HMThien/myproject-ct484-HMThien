import 'dart:js' show context;

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../models/product.dart';
import 'notifications_detail_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
    //final Future<List<Item>> itemsFuture = Item.loadItems(20);
    final List<Item> items = Item.notification;
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
                subtitle: Text(item.header_noti),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      Container(
                        child: buttonDetailNotification(),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

Widget buttonDetailNotification() {
  return IconButton.outlined(
      icon: const Icon(Icons.more_horiz),
      onPressed: () {
        Navigator.of(context as BuildContext);
        const NotificationsDetailScreen();
      });

  /*Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const NotificationsDetailScreen();
        }));*/
}

class Item {
  final String title_noti;
  final String header_noti;
  final String full_noti;

  const Item(
    this.title_noti,
    this.header_noti,
    this.full_noti,
  );
  static List<Item> notification = [
    const Item('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
    const Item('Thông báo đơn hòng', 'Cảm ơn bạn vừa đặt hàng thành công, ...',
        'Cảm ơn bạn vừa đặt hàng thành công, mã đơn hàng của bạn là HGUQWY250472. Chúng tôi sẽ sớm gọi xác nhận, bạn vui lòng giữ liên lạc trong 24h'),
    const Item('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
    const Item('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
    const Item('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
  ];
}
