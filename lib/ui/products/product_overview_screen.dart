import 'package:flutter/material.dart';
import 'product_manager.dart';
import 'package:provider/provider.dart';
import '../cart/cart_screen.dart';
import 'product_grid.dart';
import '../shared/app_drawer.dart';
import '../cart/cart_manager.dart';
import 'top_right_badge.dart';
import 'notifications_screen.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LAPTOP - PHỤ KIỆN'),
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
        actions: <Widget>[
          buildProductFilterMenu(),
          buildNotifications(),
          buildShoppingCartIcon(),
        ],
      ),
      drawer: const AppDrawer(),
      body: FutureBuilder(
        future: _fetchProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ValueListenableBuilder<bool>(
              valueListenable: _showOnlyFavorites,
              builder: (context, onlyFavorites, child) {
                return ProductsGrid(onlyFavorites);
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<CartManager>(builder: (ctx, cartManager, child) {
      return TopRightBadge(
        data: cartManager.productCount,
        child: IconButton(
          icon: const Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
            Navigator.of(ctx).pushNamed(CartScreen.routeName);
          },
        ),
      );
    });
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        // setState(() {
        if (selectedValue == FilterOptions.favorites) {
          _showOnlyFavorites.value = true;
        } else {
          _showOnlyFavorites.value = false;
        }
        // });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Hiển thị yêu thích'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Hiển thị tất cả'),
        ),
      ],
    );
  }

  Widget buildNotifications() {
    return IconButton.outlined(
      icon: const Icon(Icons.notifications_active),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const NotificationsScreen();
        }));
      },
    );
  }
}
