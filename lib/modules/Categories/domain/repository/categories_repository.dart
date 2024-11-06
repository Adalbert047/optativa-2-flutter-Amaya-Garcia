import 'package:examen_2do_parcial/infrastructure/app/repository/repository.dart';
import 'package:examen_2do_parcial/infrastructure/connection/connection.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';

class CategoriesRepository implements Repository<dynamic, List<CategoriesResponse>> {

  @override
  Future<List<CategoriesResponse>> execute(dynamic params) async {
    List<CategoriesResponse> listCategoriesResponse = [];


    String url = "https://dummyjson.com/products/categories";
    Connection connection = Connection();

    final response = await connection.get(url, headers: { 
      'Content-Type': 'application/json',
    });

    response.forEach((item) {
      CategoriesResponse newItem = CategoriesResponse.fromJson(item);
      listCategoriesResponse.add(newItem);
    });
    
    return listCategoriesResponse;
  }
}
