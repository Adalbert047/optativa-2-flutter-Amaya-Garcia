import 'dart:ffi';

class DetaildProductResponse {
  int id;
  String name;
  String description;
  double price;
  int stock;
  String urlImage;
  List<dynamic> reviews = [];

  DetaildProductResponse(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.stock,
      required this.urlImage,
      required this.reviews});

  factory DetaildProductResponse.fromJson(Map<String, dynamic> json) {
    return DetaildProductResponse(
        id: json['id'],
        name: json['title'],
        description: json['description'],
        price: json['price'],
        stock: json['stock'],
        reviews: json['reviews'],
        urlImage: json['images'][0]);
  }
}
