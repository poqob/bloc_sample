import 'package:bloc_sample/screens/ProductListScreen.dart';
import 'package:bloc_sample/screens/cartScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const ProductListScreen(),
        "/cart": (context) => const CartScreen(),
      },
      initialRoute: "/",
    );
  }
}
