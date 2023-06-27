import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';

class CartProduct extends StatefulWidget {
  final dynamic product;

  const CartProduct({Key? key, required this.product}) : super(key: key);

  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  int quantity = 1;

  // Front : Augmenter la quantité du produit sélectionné
  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  // Front : Enlever de 1 la quantité du produit sélectionné sauf si déjà à 1
  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void removeProduct() {
    // Accéder à l'instance du Provider
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);

    // Appeler la méthode de suppression du produit
    cartProvider.removeProduct(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 40,
              child: Image.network(
                widget.product['images'][0],
                scale: 6,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.product['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(widget.product['price'].toString() + ' €'),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    tooltip: 'Enlever un produit',
                    onPressed: () {
                      decreaseQuantity();
                      cartProvider.decreaseQuantityProduct(widget.product);
                    },
                  ),
                  Text(
                    widget.product['quantity'].toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    tooltip: 'Ajouter un produit',
                    onPressed: () {
                      increaseQuantity();
                      cartProvider.increaseQuantityProduct(widget.product);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                cartProvider
                        .calculateTotalPriceProduct(widget.product)
                        .toStringAsFixed(2) +
                    ' €',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Supprimer',
              onPressed: removeProduct,
            ),
          ],
        ),
      ),
    );
  }
}
