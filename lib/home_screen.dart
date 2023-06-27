import 'package:flutter/material.dart';
// import 'package:flutter_shop/shop_screen.dart';
// import 'package:flutter_shop/account_screen.dart';
import 'package:flutter_shop/shop/shop_screen.dart';
// import 'package:flutter_shop/cart_screen.dart';
import 'package:flutter_shop/cart/cart_screen.dart';
import 'package:flutter_shop/account/account_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = AccountScreen();
        break;
      case 1:
        page = ShopScreen();
        break;
      case 2:
        page = CartScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 1200,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.account_circle),
                    label: Text('Mon compte'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.production_quantity_limits),
                    label: Text('Produits'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.shopping_basket),
                    label: Text('Panier'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
