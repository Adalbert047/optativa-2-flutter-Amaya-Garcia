import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/repository/categories_repository.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_response.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/repository/categories_repository.dart';

class DetaildProductUsecase implements UseCase<int, DetaildProductResponse> {
  @override
  Future<DetaildProductResponse> execute(int params) async {
    final DetaildProductResponse response = await DetaildProductRepository().execute(params);
    return response;
  }
}
