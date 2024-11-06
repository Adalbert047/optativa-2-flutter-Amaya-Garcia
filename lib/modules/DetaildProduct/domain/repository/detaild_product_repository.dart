import 'package:examen_2do_parcial/infrastructure/app/repository/repository.dart';
import 'package:examen_2do_parcial/infrastructure/connection/connection.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_response.dart';

class DetaildProductRepository implements Repository<int, DetaildProductResponse> {

  @override
  Future<DetaildProductResponse> execute(int params) async {
    
    String url = "https://dummyjson.com/products/${params}";
    Connection connection = Connection();

    final response = await connection.get(url, headers: { 
      'Content-Type': 'application/json',
    });
    
    DetaildProductResponse productResponse = DetaildProductResponse.fromJson(response);
    
    return productResponse;
  }
}
