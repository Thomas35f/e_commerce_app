import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<dynamic> cartItems = [];

  // Ajout d'un produit au panier
  void addToCart(dynamic product) {
    var newItem = true;

    // Si même produit, update uniquement de la quantité
    for (var item in cartItems) {
      if (item['title'] == product['title']) {
        item['quantity']++;
        newItem = false;
        break;
      }
    }

    // Si c'est un nouveau produit, ajout dans le panier
    if (newItem == true) {
      product['quantity'] = 1;
      cartItems.add(product);
    }

    notifyListeners();
  }

  // Au clic sur la corbeille
  void removeProduct(dynamic product) {
    cartItems.remove(product);
    notifyListeners();
  }

  // Prix total de tous les produits
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in cartItems) {
      double price = item['price'];
      int quantity = item['quantity'];
      totalPrice += price * quantity;
    }
    return totalPrice;
  }

  // Prix total d'un produit (prix * quantité)
  double calculateTotalPriceProduct(dynamic product) {
    double totalPrice = 0;
    for (var item in cartItems) {
      if (item == product) {
        totalPrice = item['quantity'] * item['price'];
        break;
      }
    }
    return totalPrice;
  }

  // Total de la quantité de tous les produits du panier
  double calculateLenghtProducts() {
    double total = 0;
    for (var item in cartItems) {
      total += item['quantity'];
    }
    return total;
  }

  // Quantité d'un produit += 1
  void increaseQuantityProduct(dynamic product) {
    for (var item in cartItems) {
      if (item == product) {
        item['quantity']++;
        break;
      }
    }
    notifyListeners();
  }

  // quantité d'un produit -= 1 sauf si déjà à 1
  void decreaseQuantityProduct(dynamic product) {
    for (var item in cartItems) {
      if (item == product) {
        if (item['quantity'] != 1) {
          item['quantity']--;
          break;
        }
      }
    }
    notifyListeners();
  }
}
