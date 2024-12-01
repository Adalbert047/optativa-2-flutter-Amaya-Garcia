import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class SearchProductsScreen extends StatefulWidget {
  SearchProductsScreen({Key? key});

  @override
  State<StatefulWidget> createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(mytitle: "Barra de Busqueda"),
        body: Text("Barra de Busqueda"));
  }
}
