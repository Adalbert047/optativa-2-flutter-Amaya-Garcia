import 'dart:convert';
import 'dart:ffi';

import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/repository/categories_repository.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_response.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/repository/detaild_product_repository.dart';
import 'package:localstorage/localstorage.dart';

class DetaildProductUsecase implements UseCase<int, DetaildProductResponse> {
  final LocalStorage storage = LocalStorage('local_CarritoTiendita');
  @override
  Future<DetaildProductResponse> execute(int params) async {
    

    if (storage.getItem("token") == null) {
      throw Exception("No tienes el token");
    }

    final DetaildProductResponse response = await DetaildProductRepository().execute(params);
    return response;
  }
    void addProduct(DetaildProduct product) {
    List<dynamic> storedProducts = storage.getItem('productList');
    List<DetaildProduct> productList = [];

    storedProducts.forEach((item) {
      productList.add(DetaildProduct.fromJson(jsonDecode(item)));
    });

    final existingProductIndex = productList.indexWhere((item) => item.name == product.name);

    if (existingProductIndex != -1) {
     
      DetaildProduct existingProduct = productList[existingProductIndex];
      existingProduct.quant += product.quant;
      existingProduct.total = existingProduct.quant * existingProduct.price;

      print("Actualizo el total: ${existingProduct.total}");
      print("Actualizo el producto a ${existingProduct.quant} y el valor que agarre de quant es :${product.quant}");
      
      productList[existingProductIndex] = existingProduct;
      print("El producto ya existía y se actualizó su cantidad en el carrito");

    } else {

      product.total = product.quant * product.price;
      productList.add(product);
    }
    storage.setItem('productList', productList.map((e) => jsonEncode(e.toJson())).toList());

    print(jsonEncode(productList.map((e) => e.toJson()).toList()));
  }

  // void addProduct (DetaildProduct product) { 
  //   if (product != null) {

  //     final isNewProduct = storage.getItem("product_${product.name}");
      
  //     if (isNewProduct != null) {
  //       final isNewProductDecode = jsonDecode(isNewProduct);
  //       int quant = isNewProductDecode['quant'] ?? 0;
  //       product.quant += quant;
  //       product.total = product.quant * product.price;
  //       print("Actualizo el total: ${product.total}");
  //       print("Actualizo el producto a ${product.quant} y el valor que agarre de quant es :${quant}");

  //       storage.setItem("product_${product.name}", jsonEncode(product.toJson()));
  //       print("El producto ya se existian y se actualizo su cantidad en el carrito");
  //     }
  //     else {
  //       storage.setItem("product_${product.name}", jsonEncode(product.toJson()));

  //       print("Se agrega el producto por primera vez");
  //     }
      

  //     final r = storage.getItem("${(product.name)}");
  //     print(r);

  //     print(jsonDecode(r));
  //   }
  // }

  bool validationProduct (DetaildProduct product) {
    if (product.quant > product.stockR) {
      print("Producto mayor al stock real");
      return false;
    }
    else if (product.quant < 0) {
      print("Product menor a 0");
      return false;
    }
    return true;
  }
}
