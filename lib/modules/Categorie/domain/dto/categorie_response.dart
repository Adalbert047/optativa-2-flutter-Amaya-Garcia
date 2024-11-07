class CategorieResponse {
  int id;
  String name;
  String categorie;
  String urlImage;

  CategorieResponse({
    required this.id,
    required this.name,
    required this.categorie,
    required this.urlImage,
  });

  factory CategorieResponse.fromJson(Map<String, dynamic> json) {
    return CategorieResponse(
      id: json['id'],
      name: json['title'],
      categorie: json['category'],
      urlImage: json['images'][0],
    );
  }
}
