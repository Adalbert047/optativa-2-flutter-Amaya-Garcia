import 'package:examen_2do_parcial/modules/Login/domain/dto/user_credentials.dart';
import 'package:examen_2do_parcial/modules/Login/domain/dto/user_login_response.dart';
import 'package:examen_2do_parcial/modules/Login/useCase/login_usecase.dart';
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

  final TextEditingController controllerUser = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  LoginUseCase? loginUseCase;
  UserLoginResponse? userResponse;
  bool isLoading = false;
  bool isCorrect = true;


  Future preLogin () async {
    setState(() {
      isLoading = true;
      isCorrect = true;
    });

    final credentials = UserCredentials(user: controllerUser.text, password: controllerPassword.text);

    try {
      final response = await LoginUseCase().execute(credentials);

      setState(() {
        isLoading = false;
        isCorrect = true;
      });
      Navigator.pushNamed(context, Routers.categories);
    } catch (e) {
      setState(() {
        isLoading = false;
        isCorrect = false;
      });
      print("Error: $e");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(mytitle:"Login"),
      body: isLoading ? Center(child: CircularProgressIndicator()) :
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
            myTextField(placeholder: "Usuario", controller: controllerUser),
            SizedBox(height: 30),
            myTextField(placeholder: "Contraseña", controller: controllerPassword),
            Padding(padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              onPressed: preLogin, 
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
            SizedBox(height: 30),
            !isCorrect ? Text("Error, por favor, volverlo a intentar", style: TextStyle(fontSize: 15, color: Colors.red),) : Text("")
              
          ],
        ),
      )
      )
    );
  }
}