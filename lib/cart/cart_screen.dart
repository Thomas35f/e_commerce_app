import 'package:flutter/material.dart';
import 'package:flutter_shop/cart/cart_product.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, _) {
      if (cartProvider.cartItems.isEmpty) {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Aucun produit dans le panier',
                ),
              ),
            ]);
      } else {
        double totalPrice = cartProvider.calculateTotalPrice();

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.end, // Aligner les éléments à droite
                children: [
                  RichText(
                    textAlign: TextAlign.right, // Aligner le texte à droite
                    text: TextSpan(
                      text: 'Mon panier',
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Nombre d\'articles : ',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              cartProvider.calculateLenghtProducts().toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Prix total ',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: totalPrice.toStringAsFixed(2) + ' €',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        if (index >= cartProvider.cartItems.length) {
                          return SizedBox.shrink();
                        }
                        return CartProduct(
                          product: cartProvider.cartItems[index],
                        );
                      })),
            ),
          ],
        );
      }
    });
  }
}
