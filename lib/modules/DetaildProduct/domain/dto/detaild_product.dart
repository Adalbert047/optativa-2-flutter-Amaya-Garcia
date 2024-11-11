import 'dart:ffi';

class DetaildProduct {
  String name;
  String description;
  double price;
  int stock;
  String urlImage;

  DetaildProduct({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.urlImage
  });
}
