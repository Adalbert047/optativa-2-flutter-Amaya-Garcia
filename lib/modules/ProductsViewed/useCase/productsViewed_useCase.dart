import 'dart:convert';

import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product.dart';
import 'package:examen_2do_parcial/modules/ProductsViewed/domain/dto/productsViewed_products.dart';
import 'package:examen_2do_parcial/modules/Shopping/domain/dto/shopping_products.dart';
import 'package:localstorage/localstorage.dart';

class ProductsViewedUsecase
    implements UseCase<ProductsViewedProducts, dynamic> {
  final LocalStorage storage = LocalStorage('local_CarritoTiendita');

  @override
  Future<dynamic> execute(ProductsViewedProducts params) async {
    throw Exception();
  }

  List<ProductsViewedProducts> ArrayProductsViewed() {
    List<dynamic> storedProductsViewed = storage.getItem('productListViewed');
    List<ProductsViewedProducts> productsViewedProducts = [];

    storedProductsViewed.forEach((item) {
      productsViewedProducts
          .add(ProductsViewedProducts.fromJson(jsonDecode(item)));
    });

    return productsViewedProducts;
  }
}
