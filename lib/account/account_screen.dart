import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Map<String, dynamic> userData = {};

  var address1 = '';
  var address2 = '';
  var address3 = '';

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    var url = 'https://dummyjson.com/users';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Traitement des données de la réponse
      setState(() {
        userData = json.decode(response.body)['users'][0];

        address1 = userData['address']['address'];
        address2 = userData['address']['postalCode'];
        address3 = userData['address']['city'];
      });
      // Effectuer des opérations sur les données
    } else {
      // Gérer les erreurs de l'appel API
      print('Échec de la requête : ${response.statusCode}');
    }
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Image.network(
                        'https://i.dummyjson.com/data/products/2/3.jpg',
                        scale: 2),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text('Mon compte',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                          TextField(
                            controller: TextEditingController(
                                text: userData['lastName']),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nom',
                              hintText: 'John',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 16, height: 3),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          TextField(
                            controller: TextEditingController(
                                text: userData['firstName']),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Prénom',
                              hintText: 'Doe',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 16, height: 3),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          TextField(
                            controller: TextEditingController(
                                text: userData['username']),
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Pseudo',
                              hintText: 'Jodo',
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 16, height: 3),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                        ],
                      ))
                ],
              )),
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller:
                            TextEditingController(text: userData['phone']),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Téléphone',
                          hintText: '+33102030405',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16, height: 3),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      TextField(
                        controller:
                            TextEditingController(text: userData['email']),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'john.doe@nonymou.io',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16, height: 3),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: TextEditingController(text: address1),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Adresse',
                          hintText: '42 rue des escargots',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16, height: 3),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      TextField(
                        controller: TextEditingController(text: address2),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Code Postal',
                          hintText: '42420',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16, height: 3),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      TextField(
                        controller: TextEditingController(text: address3),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Ville',
                          hintText: 'Lorette',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 16, height: 3),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
