# App flutter

Un e-commerce simple en flutter

## Install

```sh
flutter pub get
flutter run
```

### Fonctionnement

Général :
- Les vues sont dans le dossier "lib"
- Les 2 pages montrant des cartes (shop + cart) ont leur propore composant dédié à une card

Formulaire : 
On simule un update des données en montrant différents champs remplis. Pour cela, on prend la 1ère data de l'api https://dummyjson.com/users

Shop :
- Utilisation de l'api : https://dummyjson.com/products

Panier : 
- Un provider est utilisé pour garder en mémoire les produits cliqués par l'utilisateur.
- Toutes les fonctions relatives au panier (quantité, prix total, etc...) sont dans le fichier "cart_provider.dart".
