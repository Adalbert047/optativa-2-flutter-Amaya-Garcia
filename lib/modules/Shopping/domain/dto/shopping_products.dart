class ShoppingProducts {
  String name;
  String description;
  int stockR;
  double price;
  int quant;
  double total;
  String date;
  String urlImage;


  ShoppingProducts({
    required this.name,
    required this.description,
    required this.stockR,
    required this.price,
    required this.date,
    required this.quant,
    required this. total,
    required this.urlImage
  });

  factory ShoppingProducts.fromJson(Map<String, dynamic> json) {
    return ShoppingProducts(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      stockR: json['stockR'],
      quant: json['quant'],
      date: json['date'],
      total: json['total'],
      urlImage: json['urlImage']
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'stockR': stockR,
        'quant': quant,
        'date': date,
        'total': total,
        'urlImage': urlImage
  };
}
