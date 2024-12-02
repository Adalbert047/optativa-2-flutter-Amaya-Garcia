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
    List<dynamic> storedProductsViewed =
        storage.getItem('productListViewed') ?? [];
    List<ProductsViewedProducts> productsViewedProducts = [];

    if (storedProductsViewed != null) {
      storedProductsViewed.forEach((item) {
        productsViewedProducts
            .add(ProductsViewedProducts.fromJson(jsonDecode(item)));
      });
    }

    return productsViewedProducts;
  }

  void addProduct(DetaildProduct product) {
    List<dynamic>? storedProducts = storage.getItem('productList') ?? [];
    List<DetaildProduct> productList = [];

    print(product);

    if (storedProducts == null || storedProducts.isEmpty) {
      product.total = 1 * product.price;
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
      existingProduct.quant += 1;
      existingProduct.total = existingProduct.quant * existingProduct.price;

      productList[existingProductIndex] = existingProduct;
      print(
          "El producto ya existía y se actualizó su cantidad en el carrito esto en Productos vistos");
    } else {
      product.total = 1 * product.price;
      productList.add(product);
    }

    storage.setItem(
        'productList', productList.map((e) => jsonEncode(e.toJson())).toList());

    print(
        "Lista de productos actualizada en LocalStorage: ${jsonEncode(productList.map((e) => e.toJson()).toList())}");
  }
}
