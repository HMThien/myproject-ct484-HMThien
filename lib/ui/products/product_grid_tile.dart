import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/ui/screens.dart';
import 'product_manager.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';
import 'product_manager.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        header: buildGridHeaderrBar(context),
        footer: Container(
          height: 100,
          child: buildGridFooterBar(context),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildGridHeaderrBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black54,
      title: Text(
        product.title,
        style: const TextStyle(
          color: Colors.yellow,
          fontSize: 19,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.shopping_cart,
          size: 20,
        ),
        onPressed: () {
          final cart = context.read<CartManager>();
          cart.addItem(product);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: const Text(
                  'San phẩm bạn chọn đã thêm vào giỏ hàng',
                ),
                duration: const Duration(seconds: 6),
                action: SnackBarAction(
                  label: 'Hủy vừa chọn',
                  onPressed: () {
                    cart.removeSingeItem(product.id!);
                  },
                ),
              ),
            );
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  Widget buildGridFooterBar(BuildContext context) {
    var price = product.price;
    //final formatVND = new NumberFormat('##.###.###', 'en_US');
    return GridTileBar(
      backgroundColor: Colors.black54,
      leading: ValueListenableBuilder<bool>(
        valueListenable: product.isFavoriteListenable,
        builder: (ctx, isFavorite, child) {
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              size: 20,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              product.isFavorite = !isFavorite;
            },
          );
        },
      ),
      title: Text(
        '$price',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Text(
        product.description,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
}
