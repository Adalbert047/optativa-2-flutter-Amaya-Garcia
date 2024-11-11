import 'dart:ffi';

class DetaildProductResponse {
  int id;
  String name;
  String description;
  double price;
  int stock;
  String urlImage;

  DetaildProductResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.urlImage
  });

  factory DetaildProductResponse.fromJson(Map<String, dynamic> json) {
    return DetaildProductResponse(
      id : json['id'],
      name: json['title'],
      description: json['description'],
      price: json['price'],
      stock: json['stock'],
      urlImage: json['images'][0]
    );
  }
}
