import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myproject/models/product.dart';
import 'ui/orders/order_screen.dart';
import 'ui/screens.dart';
import 'ui/products/product_detail_screen.dart';
import 'ui/products/product_manager.dart';
import 'ui/products/product_overview_screen.dart';
import 'ui/products/user_products_screen.dart';
import 'ui/products/contact_screen.dart';

import 'ui/cart/cart_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
export 'ui/products/edit_product_screen.dart';
import 'ui/screens.dart';
import 'ui/products/notifications_screen.dart';

// thiendt20v7x081@dttx.ctu.edu.vn
// 111111
// https://github.com/HMThien/myproject-ct484-HMThien.git
// https://project-laptop-hmt-default-rtdb.asia-southeast1.firebasedatabase.app/

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
        ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
          create: (ctx) => ProductsManager(),
          update: (ctx, authManager, productsManager) {
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
            title: 'LALTOP - PHỤ KIỆN',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'FS',
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.amber,
              ).copyWith(
                secondary: Colors.amber,
              ),
            ),
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
                } else {
                  if (settings.name == AddProductScreen.routeName) {
                    final productId = settings.arguments as String?;
                    return MaterialPageRoute(
                      builder: (ctx) {
                        return AddProductScreen(
                          productId != null
                              ? ctx.read<ProductsManager>().findById(productId)
                              : null,
                        );
                      },
                    );
                  } else {
                    if (settings.name == ContactScreen.routeName) {
                      final productId = settings.arguments as String?;
                      return MaterialPageRoute(
                        builder: (ctx) {
                          return ContactScreen(
                            productId != null
                                ? ctx
                                    .read<ProductsManager>()
                                    .findById(productId)
                                : null,
                          );
                        },
                      );
                    }
                    return null;
                  }
                }
              }
            });
      }),
    );
  }
}
