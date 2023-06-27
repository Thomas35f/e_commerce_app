import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;
  final Function()? onAddToCart;

  const ProductCard(
      {Key? key, required this.product, required this.onAddToCart})
      : super(key: key);

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Produit ajouté au panier'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 150,
            child: Image.network(
              product['images'][0],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            child: Text(
              product['category'].toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 25, 129, 145),
                wordSpacing: 8,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            child: Text(
              product['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            child: Row(
              children: [
                for (int i = 0; i < product['rating'].toInt(); i++)
                  Icon(Icons.star),
                for (int i = product['rating'].toInt(); i < 5; i++)
                  Icon(Icons.star_outline),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            child: Text(
              product['description'],
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product['price'].toString() + ' €',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                  icon: Icon(Icons.add_shopping_cart),
                  tooltip: 'Ajouter au panier',
                  onPressed: () {
                    onAddToCart!(); // Appel de la fonction existante
                    _showSnackBar(
                        context); // Affichage de la notification pop-up
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
