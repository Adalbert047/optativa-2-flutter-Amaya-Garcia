import 'dart:ffi';

class DetaildProductViewed {
  int id;
  String name;
  String description;
  double price;
  double total;
  String urlImage;
  int countViewed;

  DetaildProductViewed(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.total,
      required this.urlImage,
      required this.countViewed});

  factory DetaildProductViewed.fromJson(Map<String, dynamic> json) {
    return DetaildProductViewed(
        id: json['id'] ?? 0,
        name: json['name'],
        description: json['description'],
        price: json['price'],
        total: json['total'],
        urlImage: json['urlImage'],
        countViewed: json['countViewed'] ?? 0);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
        'total': total,
        'urlImage': urlImage,
        'countViewed': countViewed
      };
}
