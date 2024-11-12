class CategoriesResponse {
  
  String categorie;
  String name;
  String url;

  CategoriesResponse({
    required this.categorie,
    required this.name,
    required this.url,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      categorie: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }
}
