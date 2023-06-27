import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_screen.dart';
import 'package:flutter_shop/home_screen.dart';

import 'package:provider/provider.dart';
import 'cart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/panier': (context) => CartScreen(),
      },
      title: 'Flutter Shop',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeScreen(title: 'Flutter Shop Home'),
    );
  }
}
