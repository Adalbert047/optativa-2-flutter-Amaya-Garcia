import 'package:examen_2do_parcial/router/menu_option/menu_option.dart';
import 'package:examen_2do_parcial/screen/CategorieView.dart';
import 'package:examen_2do_parcial/screen/CategoriesView.dart';
import 'package:examen_2do_parcial/screen/DetaildProductView.dart';
import 'package:examen_2do_parcial/screen/LoginView.dart';
import 'package:examen_2do_parcial/screen/ProfileView.dart';
import 'package:examen_2do_parcial/screen/SearchProductsView.dart';
import 'package:examen_2do_parcial/screen/ShoppingView.dart';
import 'package:examen_2do_parcial/screen/ViewedProductsView.dart';
import 'package:flutter/material.dart';
import 'package:examen_2do_parcial/router/router.dart';

class ListRouters {
  static final Map<String, Widget Function(BuildContext)> listScreen = {
    Routers.login: (context) => Login(),
    Routers.categories: (context) => CategoriesScreen(),
    Routers.categorie: (context) => CategorieScreen(),
    Routers.detaild_product: (context) => DetaildProductScreen(),
    Routers.shopping: (context) => ShoppingScreen(),
    Routers.search: (context) => SearchProductsScreen(),
    Routers.viewedProducts: (context) => ViewedProductsScreen(),
    Routers.profile: (context) => ProfileScreen()
  };

  static final List<String> navigationBarRoutes = [
    Routers.categories,
    Routers.search,
    Routers.shopping,
    Routers.viewedProducts,
    Routers.profile
  ];
}
