import 'dart:ffi';

class DetaildProduct {
  int id;
  String name;
  String description;
  int stockR;
  double price;
  int quant;
  double total;
  String date;
  String urlImage;
  int countViewed;

  DetaildProduct(
      {required this.id,
      required this.name,
      required this.description,
      required this.stockR,
      required this.price,
      required this.date,
      required this.quant,
      required this.total,
      required this.countViewed,
      required this.urlImage});

  factory DetaildProduct.fromJson(Map<String, dynamic> json) {
    return DetaildProduct(
        id: json['id'] ?? 0,
        name: json['name'],
        description: json['description'],
        price: json['price'],
        stockR: json['stockR'] ?? 0,
        quant: json['quant'] ?? 0,
        date: json['date'],
        total: json['total'],
        countViewed: json['countViewed'] ?? 0,
        urlImage: json['urlImage']);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'stockR': stockR,
        'price': price,
        'date': date,
        'quant': quant,
        'total': total,
        'countViewed': countViewed,
        'urlImage': urlImage
      };
}
