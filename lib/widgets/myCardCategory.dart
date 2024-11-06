import 'package:flutter/material.dart';

class MyCardCategory extends StatelessWidget {

  final String mytitleProduct;
  final String myImage = "";

  const MyCardCategory({Key? key, required this.mytitleProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), 
            bottomRight: Radius.circular(15), 
            topLeft: Radius.circular(0), 
            topRight: Radius.circular(0))),
        elevation: 1,
        color: Colors.white,
        child: 
          Column(
            children: [
              Image(image: AssetImage('assets/LaptopMorada.png'),
              height: 125.0),
              Text(this.mytitleProduct, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 12),
              GestureDetector(
              onTap: () {
              },
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