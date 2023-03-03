import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/provider/product_provider.dart';
import 'screen/view/cart_screen.dart';
import 'screen/view/home_screen.dart';
import 'screen/view/product_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Homescreen(),
          'product': (context) => Productscreen(),
          'cart': (context) => Cartscreen(),
        },
      ),
    ),
  );
}
