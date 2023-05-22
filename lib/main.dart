// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myshop/ui/orders/orders_screen.dart';
import 'package:myshop/ui/products/edit_product_screen.dart';
import 'package:myshop/ui/screens.dart';
import 'ui/screens.dart';
// ignore: unused_import
import 'ui/products/product_detail_screen.dart';
// ignore: unused_import
import 'ui/products/product_manager.dart';
import 'ui/products/product_overview_screen.dart';
import 'ui/products/user_products_screen.dart';

import 'ui/cart/cart_screen.dart';

import 'package:provider/provider.dart';
export 'products/edit_product_screen.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthManager(),
        ),
        /*ChangeNotifierProvider(
          create: (ctx) => ProductsManager(),
        ),*/ // phan 4 buoc 2

        ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
          create: (ctx) => ProductsManager(),
          update: (ctx, authManager, productsManager) {
// Khi authManager có báo hiệu thay đổi thì đọc lại authToken
// cho productManager
            productsManager!.authToken = authManager.authToken;
            return productsManager;
          },
        ),

        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersManager(),
        ),
      ],
      child: Consumer<AuthManager>(builder: (ctx, authManager, child) {
        return MaterialApp(
            title: 'MyShop',
            //debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple,
              ).copyWith(
                secondary: Colors.deepOrange,
              ),
            ),
            /*home: Scaffold(
            appBar: AppBar(
              title: const Text('MyShop'),
            ),
            body: const Center(
              child: Text('Welcome to MyShop'),
            ),
          ),*/
            /*home: const SafeArea(
            /*child: ProductDetailScreen(
              ProductsManager().items[0],*/ //Khuc sau Phần 1 buoc 2
            child: ProductsOverviewScreen(),
          ),*/ // P1 buoc 4
            /*home: const SafeArea(
            // child: UserProductsScreen(), phan 2 buoc 1
            // child: CartScreen(), phần 2 buoc 2
            child: OrdersScreen(),*/ //Phan 2 buoc 3

            home: authManager.isAuth
                ? const ProductsOverviewScreen()
                : FutureBuilder(
                    future: authManager.tryAutoLogin(),
                    builder: (ctx, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const AuthScreen();
                    },
                  ),
            routes: {
              CartScreen.routeName: (ctx) => const CartScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == ProductDetailScreen.routeName) {
                final productId = settings.arguments as String;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return ProductDetailScreen(
                      // ProductsManager().findById(productId)!, Phan 3 buoc 2

                      ctx.read<ProductsManager>().findById(productId)!,
                    );
                  },
                );
              } else {
                if (settings.name == EditProductScreen.routeName) {
                  final productId = settings.arguments as String?;
                  return MaterialPageRoute(
                    builder: (ctx) {
                      return EditProductScreen(
                        productId != null
                            ? ctx.read<ProductsManager>().findById(productId)
                            : null,
                      );
                    },
                  );
                }
                return null;
              }
            });
      }),
    );
  }
}
