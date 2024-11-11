import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/repository/categories_repository.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_response.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/repository/detaild_product_repository.dart';
import 'package:localstorage/localstorage.dart';

class DetaildProductUsecase implements UseCase<int, DetaildProductResponse> {
  @override
  Future<DetaildProductResponse> execute(int params) async {
    final LocalStorage storage = LocalStorage('localstorage_app');

    if (!storage.getItem("token")) {
      print("No tiene token");
    }

    final DetaildProductResponse response = await DetaildProductRepository().execute(params);
    return response;
  }
}
