import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_shop/shop/product_card.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<dynamic> products = [];
  List<dynamic> cartItems = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    var url = 'https://dummyjson.com/products';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Traitement des données de la réponse
      setState(() {
        products = json.decode(response.body)['products'];
      });
      // Effectuer des opérations sur les données
    } else {
      // Gérer les erreurs de l'appel API
      print('Échec de la requête : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount;

    if (screenWidth > 900) {
      crossAxisCount = 3; // Pour les écrans larges
    } else if (screenWidth > 600) {
      crossAxisCount = 2; // Pour les écrans de taille moyenne
    } else {
      crossAxisCount = 1; // Pour les petits écrans
    }

    return Center(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        primary: false,
        itemCount: products.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return Consumer<CartProvider>(
            builder: (context, cartProvider, _) {
              return ProductCard(
                product: products[index],
                onAddToCart: () {
                  cartProvider.addToCart(products[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
