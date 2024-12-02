import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product.dart';
import 'package:examen_2do_parcial/modules/ProductsViewed/domain/dto/productsViewed_products.dart';
import 'package:examen_2do_parcial/modules/ProductsViewed/useCase/productsViewed_useCase.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myNavigationBar.dart';
import 'package:flutter/material.dart';

class ViewedProductsScreen extends StatefulWidget {
  ViewedProductsScreen({Key? key});

  @override
  State<StatefulWidget> createState() => _ViewedProductsState();
}

class _ViewedProductsState extends State<ViewedProductsScreen> {
  ProductsViewedUsecase useCaseProductViewed = ProductsViewedUsecase();
  List<ProductsViewedProducts> arrayProducts =
      ProductsViewedUsecase().ArrayProductsViewed();

  void addProduct(ProductsViewedProducts product) {
    final productDetaild = DetaildProduct(
        id: product!.id,
        name: product!.name,
        description: product!.description,
        stockR: 0,
        price: product!.price,
        countViewed: 0,
        date: DateTime.now().toString(),
        quant: 1,
        total: 1 * product!.price,
        urlImage: product!.urlImage);
    useCaseProductViewed.addProduct(productDetaild);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(mytitle: "Productos Vistos"),
        bottomNavigationBar: MyNavigationExample(initialPageIndex: 3),
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(
                "${arrayProducts[index].name} - Precio ${arrayProducts[index].price.toStringAsFixed(2).toString()}"),
            subtitle: Text(
                "Cantidad de veces vista ${arrayProducts[index].countViewed.toString()}",
                style: TextStyle(color: const Color.fromARGB(255, 78, 74, 74))),
            trailing: GestureDetector(
                onTap: () {
                  addProduct(arrayProducts[index]);
                },
                child: Icon(
                  Icons.shopping_basket_rounded,
                  color: Colors.red,
                )),
            onTap: () {},
          ),
          separatorBuilder: (_, __) => Divider(),
          itemCount: arrayProducts.length,
        ));
  }
}
