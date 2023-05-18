import 'package:flutter/material.dart';
// ignore: unused_import
import 'ui/products/product_detail_screen.dart';
// ignore: unused_import
import '/ui/products/product_manager.dart';
import 'ui/products/product_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      home: const SafeArea(
        /*child: ProductDetailScreen(
          ProductsManager().items[0],*/ //Khuc sau Phần 1 buoc 3
        child: ProductsOverviewScreen(),
      ),
    );
  }
}
