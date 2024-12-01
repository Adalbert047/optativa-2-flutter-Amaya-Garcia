import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_credentials.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_login_response.dart';
import 'package:examen_2do_parcial/modules/Login/domain/repository/login_repository.dart';
import 'package:examen_2do_parcial/modules/ProductSearch/domain/dto/productSearch_Response.dart';
import 'package:examen_2do_parcial/modules/ProductSearch/domain/repository/productSearch_repository.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';

class ProductSearchUsecase
    implements UseCase<String, List<ProductSearchResponse>> {
  @override
  Future<List<ProductSearchResponse>> execute(String params) async {
    final LocalStorage storage = LocalStorage('local_CarritoTiendita');

    final response = await ProductSearchRepository().execute(params);

    if (storage.getItem("token") == null) {
      throw Exception("No tienes el token");
    }

    return response;
  }
}
