import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/repository/categories_repository.dart';
import 'package:localstorage/localstorage.dart';

class CategoriesUsecase implements UseCase<dynamic, List<CategoriesResponse>> {
  @override
  Future<List<CategoriesResponse>> execute(dynamic params) async {

    final LocalStorage storage = LocalStorage('local_CarritoTiendita');

    if (storage.getItem("token") == null) {
      throw Exception("No tienes el token");
    }

    final List<CategoriesResponse> response = await CategoriesRepository().execute(params);
    return response;
  }
}
