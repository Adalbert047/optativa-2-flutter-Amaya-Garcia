import 'package:examen_2do_parcial/infrastructure/app/repository/repository.dart';
import 'package:examen_2do_parcial/infrastructure/connection/connection.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_credentials.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_login_response.dart';
import 'package:examen_2do_parcial/modules/ProductSearch/domain/dto/productSearch_Response.dart';

class ProductSearchRepository
    implements Repository<String, List<ProductSearchResponse>> {
  @override
  Future<List<ProductSearchResponse>> execute(String params) async {
    List<ProductSearchResponse> listProductSearchResponse = [];

    String url = "https://dummyjson.com/products/search?q=${params}";

    Connection connection = Connection();
    final response = await connection.get(url, headers: {
      'Content-Type': 'application/json',
    });
    print(response);

    response['products'].forEach((item) {
      print(item);
      ProductSearchResponse newItem = ProductSearchResponse.fromJson(item);
      listProductSearchResponse.add(newItem);
    });

    return listProductSearchResponse;
  }
}
