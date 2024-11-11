import 'package:examen_2do_parcial/router/menu_option/menu_option.dart';
import 'package:examen_2do_parcial/screen/CategorieView.dart';
import 'package:examen_2do_parcial/screen/CategoriesView.dart';
import 'package:examen_2do_parcial/screen/DetaildProductView.dart';
import 'package:examen_2do_parcial/screen/LoginView.dart';
import 'package:examen_2do_parcial/screen/ShoppingView.dart';
import 'package:flutter/material.dart';
import 'package:examen_2do_parcial/router/router.dart';

class ListRouters {
  static final Map<String, Widget Function(BuildContext)> listScreen = {
      Routers.login: (context) => Login(),
      Routers.categories: (context) => CategoriesScreen(),
      Routers.categorie: (context) => CategorieScreen(),
      Routers.detaild_product: (context) => DetaildProductScreen(),
      Routers.shopping : (context) => ShoppingScreen()
      
  };
    static List<MenuOption> menuOption = [
    MenuOption(description: "Pantalla Categories", route: Routers.categories, screen: CategoriesScreen(), icon: Icons.list),
    MenuOption(description: "Pantalla Categorie", route: Routers.categorie, screen: CategorieScreen(), icon: Icons.play_circle_rounded),
    MenuOption(description: "Pantalla de Detalle de product", route: Routers.detaild_product, screen: DetaildProductScreen(), icon: Icons.security)
  ];
}