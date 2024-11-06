import 'dart:ffi';

class DetaildProductResponse {
  String name;
  String description;
  Double price;
  Int stock;
  String urlImage;

  DetaildProductResponse({
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.urlImage
  });

  factory DetaildProductResponse.fromJson(Map<String, dynamic> json) {
    return DetaildProductResponse(
      name: json['title'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      urlImage: json['images'][1]
    );
  }
}
