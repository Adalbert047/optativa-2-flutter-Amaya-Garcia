import 'package:examen_2do_parcial/infrastructure/app/repository/repository.dart';
import 'package:examen_2do_parcial/infrastructure/connection/connection.dart';
import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';

class CategorieRepository implements Repository<String, List<CategorieResponse>> {

  @override
  Future<List<CategorieResponse>> execute(String params) async {
    List<CategorieResponse> listCategorieResponse = [];

    print(params);
    String url = "https://dummyjson.com/products/category/${params}";
    Connection connection = Connection();

    final response = await connection.get(url, headers: { 
      'Content-Type': 'application/json',
    });

    response["products"].forEach((item) {
      CategorieResponse newItem = CategorieResponse.fromJson(item);
      listCategorieResponse.add(newItem);
    });

    return listCategorieResponse;
  }
}
