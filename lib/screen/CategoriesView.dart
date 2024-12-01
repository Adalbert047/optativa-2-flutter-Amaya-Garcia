import 'package:examen_2do_parcial/modules/Categories/UseCase/categories_useCase.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myNavigationBar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<CategoriesResponse>? categoriesFuture;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUseCase();
  }

  Future fetchUseCase() async {
    categoriesFuture = await CategoriesUsecase().execute("");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(mytitle: "Categorias"),
        bottomNavigationBar: MyNavigationExample(),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(categoriesFuture![index].name.toUpperCase()),
                  subtitle: Text(categoriesFuture![index].categorie,
                      style: TextStyle(color: Colors.grey)),
                  leading: index % 2 == 0
                      ? Icon(Icons.edit_document, color: Colors.blue)
                      : Icon(Icons.no_food_sharp, color: Colors.red),
                  trailing: index % 2 == 0
                      ? Icon(Icons.arrow_forward_ios, color: Colors.blue)
                      : Icon(Icons.arrow_forward_ios_outlined,
                          color: Colors.red),
                  onTap: () => Navigator.pushNamed(context, Routers.categorie,
                      arguments: categoriesFuture![index]),
                ),
                separatorBuilder: (_, __) => Divider(),
                itemCount: categoriesFuture!.length,
              ));
  }
}
