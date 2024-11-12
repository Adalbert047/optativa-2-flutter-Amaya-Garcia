import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/UseCase/detaild_product_useCase.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product.dart';
import 'package:examen_2do_parcial/modules/DetaildProduct/domain/dto/detaild_product_response.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetaildProductScreen extends StatefulWidget {
  @override
  _DetaildProductScreenState createState() => _DetaildProductScreenState();
}

class _DetaildProductScreenState extends State<DetaildProductScreen> {

  final TextEditingController controllerQuant = TextEditingController();
  DetaildProductResponse? productResponse;
  final DetaildProductUsecase detaildProductUseCase = DetaildProductUsecase();
  CategorieResponse? categorie;
  int id = 0;
  bool isLoading = true;
  bool isCorrect = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as int;
    fetchUseCase();
  }

  Future fetchUseCase () async {
    productResponse = await detaildProductUseCase.execute(id);
    setState(() {
      isLoading = false;
    });
  }

  void addProduct () {
    final productDetaild = DetaildProduct(
      id: productResponse!.id,
      name: productResponse!.name, 
      description: productResponse!.description, 
      stockR: productResponse!.stock, 
      price: productResponse!.price, 
      date: DateTime.now().toString(), 
      quant: int.tryParse(controllerQuant.text) ?? 0, 
      total: (double.tryParse(controllerQuant.text) ?? 0) * productResponse!.price, 
      urlImage: productResponse!.urlImage);


    try {
      setState(() {
        isCorrect = detaildProductUseCase.validationProduct(productDetaild);
      });
    } catch (e) {
      setState(() {
        isCorrect = false;
      });
      print("Error: $e");
    }

    if (isCorrect) {
      detaildProductUseCase.addProduct(productDetaild);
    }
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
            Padding(padding: EdgeInsets.only(left: 80, right: 80),
            child: TextField(
              decoration: new InputDecoration(labelText: "Escribe la cantidad de productos"),
              controller: controllerQuant,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            )),
            SizedBox(height: 15),
            ElevatedButton(onPressed: addProduct, 
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
              ),),
              SizedBox(height: 15),
              ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, Routers.shopping);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                fixedSize: Size(120, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
                )
              ), 
              child: Icon(Icons.store)),
              isCorrect ? Text("") : Padding(padding: EdgeInsets.all(15), child: Text("No puedes tener una cantidad mayor al stock real y debe ser un valor mayor a 0", style: TextStyle(fontSize: 15, color: Colors.red), textAlign: TextAlign.center,)) 
          ],
        ),)
      );
  }
}