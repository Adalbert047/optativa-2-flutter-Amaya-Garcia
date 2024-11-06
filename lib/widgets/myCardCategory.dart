import 'package:examen_2do_parcial/modules/Categorie/domain/dto/categorie_response.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:flutter/material.dart';

class MyCardCategory extends StatelessWidget {
  final CategorieResponse categorie;

  const MyCardCategory({Key? key,required this.categorie }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), 
            bottomRight: Radius.circular(15), 
            topLeft: Radius.circular(0), 
            topRight: Radius.circular(0))),
        elevation: 2,
        color: Colors.white,
        child: 
          Column(
            children: [
              Image(image: NetworkImage(this.categorie.urlImage),
              height: 100.0),
              Text(this.categorie.name, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 12),
              GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routers.detaild_product, arguments: categorie),
              child: Text("Detalles", 
                     style: TextStyle(
                       fontSize: 18,
                       color: Colors.blue,
                       decoration: TextDecoration.underline,
                       decorationColor: Colors.blue,
                     ),
                     textAlign: TextAlign.center,))
            ],
        ),
    ));
  }
}