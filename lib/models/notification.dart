import 'package:flutter/foundation.dart';

class Noti {
  final String title_noti;
  final String header_noti;
  final String full_noti;

  const Noti(
    this.title_noti,
    this.header_noti,
    this.full_noti,
  );
  static List<Noti> notification = [
    const Noti('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
    const Noti('Thông báo đơn hòng', 'Cảm ơn bạn vừa đặt hàng thành công, ...',
        'Cảm ơn bạn vừa đặt hàng thành công, mã đơn hàng của bạn là HGUQWY250472. Chúng tôi sẽ sớm gọi xác nhận, bạn vui lòng giữ liên lạc trong 24h'),
    const Noti('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
    const Noti('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
    const Noti('Thông báo tài khoản', 'Bạn vừa đăng nhập vào thiết bị khác...',
        'Bạn vừa đăng nhập vào thiết bị khác là trình duyệt desktop có vị trí tại Hồ Chí Minh City. Nếu là bạn vui lòng bỏ qua thông báo này'),
  ];
}
