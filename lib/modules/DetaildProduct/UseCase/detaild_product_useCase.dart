import 'dart:convert';
import 'dart:ffi';

import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_response.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_viewed.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/repository/detaild_product_repository.dart';
import 'package:localstorage/localstorage.dart';

class DetaildProductUsecase implements UseCase<int, DetaildProductResponse> {
  final LocalStorage storage = LocalStorage('local_CarritoTiendita');
  @override
  Future<DetaildProductResponse> execute(int params) async {
    if (storage.getItem("token") == null) {
      throw Exception("No tienes el token");
    }

    final DetaildProductResponse response =
        await DetaildProductRepository().execute(params);
    return response;
  }

  void addProductViewed(DetaildProductViewed product) {
    List<dynamic>? storedProductsViewed = storage.getItem('productListViewed');
    List<DetaildProductViewed> productListViewed = [];
    if (storedProductsViewed == null || storedProductsViewed.isEmpty) {
      product.countViewed += product.countViewed;
      productListViewed.add(product);
      storage.setItem('productListViewed',
          productListViewed.map((e) => jsonEncode(e.toJson())).toList());
      print(
          "Se agrega el primer producto ala lista de productos vistos: ${productListViewed}");
      return;
    }

    storedProductsViewed.forEach((item) {
      productListViewed.add(DetaildProductViewed.fromJson(jsonDecode(item)));
    });

    final existingProductIndex =
        productListViewed.indexWhere((item) => item.name == product.name);

    if (existingProductIndex != -1) {
      DetaildProductViewed existingProduct =
          productListViewed[existingProductIndex];
      existingProduct.countViewed += 1;

      print("Actualizo el total de vistas: ${existingProduct.countViewed}");
      productListViewed[existingProductIndex] = existingProduct;
    } else {
      productListViewed.add(product);
    }

    storage.setItem('productListViewed',
        productListViewed.map((e) => jsonEncode(e.toJson())).toList());
  }

  void addProduct(DetaildProduct product) {
    List<dynamic>? storedProducts = storage.getItem('productList');
    List<DetaildProduct> productList = [];

    if (storedProducts == null || storedProducts.isEmpty) {
      product.total = product.quant * product.price;
      productList.add(product);
      storage.setItem('productList',
          productList.map((e) => jsonEncode(e.toJson())).toList());
      return;
    }

    storedProducts.forEach((item) {
      productList.add(DetaildProduct.fromJson(jsonDecode(item)));
    });

    final existingProductIndex =
        productList.indexWhere((item) => item.name == product.name);

    if (existingProductIndex != -1) {
      DetaildProduct existingProduct = productList[existingProductIndex];
      existingProduct.quant += product.quant;
      existingProduct.total = existingProduct.quant * existingProduct.price;

      productList[existingProductIndex] = existingProduct;
      print("El producto ya existía y se actualizó su cantidad en el carrito");
    } else {
      product.total = product.quant * product.price;
      productList.add(product);
    }

    storage.setItem(
        'productList', productList.map((e) => jsonEncode(e.toJson())).toList());

    print(
        "Lista de productos actualizada en LocalStorage: ${jsonEncode(productList.map((e) => e.toJson()).toList())}");
  }

  bool validationProduct(DetaildProduct product) {
    print(product.quant);
    if (product.quant > product.stockR) {
      throw Exception("No puedes tener un stock mayor al stock real");
    } else if (!(product.quant > 0)) {
      throw Exception("No puedes tener un stock mayor a 0");
    }
    return true;
  }
}
