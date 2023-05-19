import 'package:flutter/material.dart';
import 'package:project_last/screens/cart_page.dart';
import 'package:project_last/screens/customer_into_page.dart';
import 'package:project_last/screens/favourite_page.dart';
import 'package:project_last/screens/home_page.dart';
import 'package:project_last/modal/pro_detail_modal.dart';
import 'package:project_last/screens/invoice_preview_page.dart';
import 'package:project_last/screens/product_page.dart';
import 'package:project_last/utils/routes_util.dart';

void main() => runApp(
      const Myapp(),
    );

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool black = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        MyRoutes.home_page: (context) => home_page(),
        MyRoutes.favourite_page: (context) => const FavouritePage(),
        MyRoutes.cart_page: (context) => const CartPage(),
        'customer_intro_page': (context) => const CustomerIntroPage(),
        'Product_page': (context) => const product_page(),
        MyRoutes.invoice_preview_page: (context) => InvoicePreviewPage(),
      },
    );
  }
}
