import 'package:examen_2do_parcial/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key});

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(mytitle: "Perfil"), body: Text("Productos Visto"));
  }
}
