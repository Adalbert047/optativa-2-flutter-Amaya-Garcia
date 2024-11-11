import 'package:examen_2do_parcial/modules/Shopping/domain/dto/shopping_products.dart';
import 'package:examen_2do_parcial/modules/Shopping/useCase/shopping_usecase.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  ShoppingScreen({Key? key});

  @override
  State<StatefulWidget> createState() => _ShoppingState();
}

class _ShoppingState extends State<ShoppingScreen> { 

  List<ShoppingProducts> arrayProducts = ShoppingUseCase().ArrayProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(mytitle: "Precio Total ${ShoppingUseCase().TotalPrice().toStringAsFixed(2).toString()} " ),
      body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text("${arrayProducts[index].name} - Total ${arrayProducts[index].total.toStringAsFixed(2).toString()}"),
              subtitle: Text("Cantidad ${arrayProducts[index].quant.toString()} - Fecha ${arrayProducts[index].date}",
              style: TextStyle(
                color: Colors.grey
              )),
              trailing: Icon(Icons.delete_outline_rounded), 
              leading: Image(image: NetworkImage(arrayProducts[index].urlImage),
              height: 100.0,
              width: 50.0,),
              onTap: () {},
            ), 
            separatorBuilder: (_, __) => Divider(), 
            itemCount: arrayProducts.length,
          ));
  }  
}