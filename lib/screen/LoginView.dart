import 'package:examen_2do_parcial/router/ListRouters.dart';
import 'package:examen_2do_parcial/router/menu_option/menu_option.dart';
import 'package:examen_2do_parcial/router/router.dart';
import 'package:examen_2do_parcial/screen/CategoriesView.dart';
import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:examen_2do_parcial/widgets/myTextField.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  Login({Key? key});

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(mytitle:"Login"),
      body: 
      Center(
        child: Padding(padding: EdgeInsets.only(left: 25, right: 25),
          child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image(image: AssetImage('assets/LaptopMorada.png'),
              fit: BoxFit.cover,),
            ),
            myTextField(placeholder: "Usuario", controller: null),
            SizedBox(height: 30),
            myTextField(placeholder: "Contraseña", controller: null),
            Padding(padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routers.categories);
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: Size(140, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Text("Ingresar"))
            ),  
          ],
        ),
      )
      )
    );
  }
}