import 'package:examen_2do_parcial/modules/Categories/UseCase/categories_useCase.dart';
import 'package:examen_2do_parcial/modules/Categories/domain/dto/categories_response.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class CategorieScreen extends StatefulWidget {
  @override
  _CategorieScreenState createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen> {
  late Future<List<CategoriesResponse>> categoriesFuture;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(mytitle:"Productos"),
      body: Text("")
    );
  }
}