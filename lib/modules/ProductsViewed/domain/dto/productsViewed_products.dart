class ProductsViewedProducts {
  int id;
  String name;
  double price;
  int quant;
  double total;
  int countViewed;
  String description;
  String urlImage;

  ProductsViewedProducts(
      {required this.id,
      required this.name,
      required this.price,
      required this.quant,
      required this.total,
      required this.description,
      required this.urlImage,
      required this.countViewed});

  factory ProductsViewedProducts.fromJson(Map<String, dynamic> json) {
    return ProductsViewedProducts(
      name: json['name'],
      countViewed: json['countViewed'],
      id: json['id'] ?? 0,
      description: json['description'],
      urlImage: json["urlImage"],
      price: json['price'] ?? 0,
      quant: json['quant'] ?? 0,
      total: json['total'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'quant': quant,
        'total': total,
        'urlImage': urlImage,
        'description': description,
        'countViewed': countViewed
      };
}
