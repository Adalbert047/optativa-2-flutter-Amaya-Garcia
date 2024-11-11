
import 'dart:convert';

import 'package:examen_2do_parcial/infrastructure/app/useCase/use_case.dart';
import 'package:examen_2do_parcial/modules/Shopping/domain/dto/shopping_products.dart';
import 'package:localstorage/localstorage.dart';

class ShoppingUseCase implements UseCase<ShoppingProducts, dynamic> {
  final LocalStorage storage = LocalStorage('local_CarritoTiendita');
  

  @override
  Future<dynamic> execute(ShoppingProducts params) async {    
    throw Exception();
  }
  
  List<ShoppingProducts> ArrayProducts() {
    List<dynamic> storedProducts = storage.getItem('productList');
    List<ShoppingProducts> shoppingsProducts = [];

    storedProducts.forEach((item) {
      shoppingsProducts.add(ShoppingProducts.fromJson(jsonDecode(item)));
    });
    print(shoppingsProducts);

    return shoppingsProducts;
  }

  double TotalPrice () {
    List<dynamic> storedProducts = storage.getItem('productList');
    double priceTotal = 0;

    storedProducts.forEach((item) {
      final product = ShoppingProducts.fromJson(jsonDecode(item));
      priceTotal += product.total;
    });

    return priceTotal;
  }
}
