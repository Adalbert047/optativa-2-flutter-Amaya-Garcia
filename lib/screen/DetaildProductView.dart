import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myCardCategory.dart';
import 'package:flutter/material.dart';

class DetaildProductScreen extends StatefulWidget {
  @override
  _DetaildProductScreenState createState() => _DetaildProductScreenState();
}

class _DetaildProductScreenState extends State<DetaildProductScreen> {


  // List<CategorieResponse> categorieFuture = [];
  // CategoriesResponse? category;
  bool isLoading = true;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   category = ModalRoute.of(context)!.settings.arguments as CategoriesResponse;
  //   fetchUseCase();
  // }

  Future fetchUseCase () async {
    
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: MyAppBar(mytitle:"Detalle de product"),
      body: isLoading ? 
      Center(child: CircularProgressIndicator()) : Text("texto")
    );
  }
}