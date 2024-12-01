class ProductSearchResponse {
  int id;
  String title;
  String description;
  String category;
  double price;
  int stock;

  ProductSearchResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.stock,
  });

  factory ProductSearchResponse.fromJson(Map<String, dynamic> json) {
    return ProductSearchResponse(
      id: json['id'],
      title: json['title'],
      description: json["description"],
      category: json["category"],
      price: json["price"],
      stock: json["stock"],
    );
  }
}
