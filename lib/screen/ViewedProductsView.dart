import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myNavigationBar.dart';
import 'package:flutter/material.dart';

class ViewedProductsScreen extends StatefulWidget {
  ViewedProductsScreen({Key? key});

  @override
  State<StatefulWidget> createState() => _ViewedProductsState();
}

class _ViewedProductsState extends State<ViewedProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(mytitle: "Productos Vistos"),
        bottomNavigationBar: MyNavigationExample(initialPageIndex: 3),
        body: Text("Productos Visto"));
  }
}
