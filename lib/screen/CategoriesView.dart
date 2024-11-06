import 'package:examen_2do_parcial/modules/Categories/UseCase/categories_useCase.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<CategoriesResponse>> categoriesFuture;

  @override
  void initState() {
    super.initState();
    categoriesFuture = CategoriesUsecase().execute("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(mytitle:"Categorias"),
      body: FutureBuilder(future: categoriesFuture, builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        else {
          List<CategoriesResponse> categories = snapshot.data ?? [];
            return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(categories[index].name.toUpperCase()),
                subtitle: Text(categories[index].categorie,
                style: TextStyle(
                  color: Colors.grey
                )),
                leading: index % 2 == 0 ? Icon(Icons.edit_document, color: Colors.blue) : Icon(Icons.no_food_sharp, color: Colors.red) ,
                trailing: index % 2 == 0 ? Icon(Icons.arrow_forward_ios, color: Colors.blue) : Icon(Icons.arrow_forward_ios_outlined, color: Colors.red),
                onTap: () => Navigator.pushNamed(context, Routers.categorie),
              ), 
              separatorBuilder: (_, __) => Divider(), 
              itemCount: categories.length,
            );
        }
      }) 
    );
  }
}