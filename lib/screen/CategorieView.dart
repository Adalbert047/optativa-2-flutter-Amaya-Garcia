import 'package:examen_2do_parcial/modules/Categorie/UseCase/categorie_useCase.dart';
import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/Categories/UseCase/categories_useCase.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myCardCategory.dart';
import 'package:flutter/material.dart';

class CategorieScreen extends StatefulWidget {
  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  List<CategorieResponse> categorieFuture = [];
  CategoriesResponse? category;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    category = ModalRoute.of(context)!.settings.arguments as CategoriesResponse;
    fetchUseCase();
  }

  Future fetchUseCase () async {
    categorieFuture = await CategorieUsecase().execute(category!.categorie);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: MyAppBar(mytitle:"Productos"),
      body: isLoading ? 
      Center(child: CircularProgressIndicator()) :
      Padding(padding: EdgeInsets.only(left: 15, right: 15, top: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 10, 
        runSpacing: 10,
        children: categorieFuture.map((product) {
          return MyCardCategory(
            categorie: product,
          );
        }).toList(),
      ),
      )
    );
  }
}