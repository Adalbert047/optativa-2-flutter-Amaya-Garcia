import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/Categorie/domain/repository/categorie_repository.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/repository/categories_repository.dart';
import 'package:localstorage/localstorage.dart';

class CategorieUsecase implements UseCase<String, List<CategorieResponse>> {
  @override
  Future<List<CategorieResponse>> execute(String params) async {

    final LocalStorage storage = LocalStorage('local_CarritoTiendita');

    if (storage.getItem("token") == null) {
      throw Exception("No tienes el token");
    }

    final List<CategorieResponse> response = await CategorieRepository().execute(params);
    return response;
  }
}
