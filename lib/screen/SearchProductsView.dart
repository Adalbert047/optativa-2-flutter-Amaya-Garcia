import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/Categories/UseCase/categories_useCase.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/modules/ProductSearch/domain/dto/productSearch_Response.dart';
import 'package:examen_2do_parcial/modules/ProductSearch/useCase/productSearch_useCase.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myCardCategory.dart';
import 'package:examen_2do_parcial/widgets/myNavigationBar.dart';
import 'package:examen_2do_parcial/widgets/myTextField.dart';
import 'package:flutter/material.dart';

class SearchProductsScreen extends StatefulWidget {
  SearchProductsScreen({Key? key});

  @override
  State<StatefulWidget> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProductsScreen> {
  bool isLoading = true;
  List<ProductSearchResponse> productsSearchResponse = [];
  final TextEditingController controllerdSearch = TextEditingController();

  Future fetchUseCase(String params) async {
    productsSearchResponse = await ProductSearchUsecase().execute(params);
    setState(() {
      isLoading = false;
    });
  }

  isSearchProducts() {
    if (controllerdSearch.text.isNotEmpty) {
      fetchUseCase(controllerdSearch.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(mytitle: "Buscar productos"),
        bottomNavigationBar: MyNavigationExample(initialPageIndex: 1),
        body: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(20),
              child: myTextField(
                  placeholder: "Buscar Products",
                  controller: controllerdSearch),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: isSearchProducts,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    fixedSize: Size(140, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text("Buscar")),
            SizedBox(height: 20),
            Expanded(
                child: isLoading
                    ? Center(
                        child: Text("No hay productos a buscar"),
                      )
                    : SizedBox(
                        height: double.infinity,
                        child: ListView.separated(
                          itemBuilder: (context, index) => ListTile(
                            title: Text(productsSearchResponse[index]
                                .title
                                .toUpperCase()),
                            subtitle: Text(
                                productsSearchResponse![index].category,
                                style: TextStyle(color: Colors.grey)),
                            leading:
                                Icon(Icons.edit_document, color: Colors.blue),
                            trailing: Icon(Icons.arrow_forward_ios,
                                color: Colors.blue),
                            onTap: () => {},
                          ),
                          separatorBuilder: (_, __) => Divider(),
                          itemCount: productsSearchResponse.length,
                        )))
          ],
        ));
  }
}
