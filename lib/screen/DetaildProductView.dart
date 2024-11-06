import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/UseCase/detaild_product_useCase.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_response.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myCardCategory.dart';
import 'package:flutter/material.dart';

class DetaildProductScreen extends StatefulWidget {
  @override
  _DetaildProductScreenState createState() => _DetaildProductScreenState();
}

class _DetaildProductScreenState extends State<DetaildProductScreen> {


  DetaildProductResponse? productResponse;
  CategorieResponse? categorie;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categorie = ModalRoute.of(context)!.settings.arguments as CategorieResponse;
    fetchUseCase();
  }

  Future fetchUseCase () async {
    productResponse = await DetaildProductUsecase().execute(categorie!.id);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      appBar: MyAppBar(mytitle:"Detalle de product"),
      body: isLoading ? 
      Center(child: CircularProgressIndicator()) : 
        Padding(padding: EdgeInsets.only(left: 15, right: 15, top: 70),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: NetworkImage(productResponse!.urlImage),
              height: 250.0),
            Text(productResponse!.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )),
            SizedBox(height: 20),
            Text(productResponse!.description,
            style: TextStyle(
              fontSize: 14
            )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price ${productResponse!.price.toString()}"),
                Text("Stock ${productResponse!.stock.toString()}"),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () {}, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.hdr_plus_rounded, color: Colors.white),
                Text("Añadir")
              ],
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size(120, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ),)
          ],
        ),)
      );
  }
}