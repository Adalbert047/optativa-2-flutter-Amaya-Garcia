import 'package:examen_2do_parcial/router/router.dart';
import 'package:flutter/material.dart';
import 'package:examen_2do_parcial/router/ListRouters.dart';

class MyNavigationExample extends StatefulWidget {
  const MyNavigationExample({super.key});

  @override
  State<MyNavigationExample> createState() => _MyNavigationbarState();
}

class _MyNavigationbarState extends State<MyNavigationExample> {
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;

    return NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          Navigator.pushNamed(context, ListRouters.navigationBarRoutes[index]);
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.search)),
            label: 'Buscador',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.shopping_cart_rounded),
            ),
            label: 'Shopping',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.production_quantity_limits),
            ),
            label: 'Productos Vistos',
          ),
          NavigationDestination(
            icon: Badge(
              child: Icon(Icons.person_2_outlined),
            ),
            label: 'Perfil',
          ),
        ]);
  }
}
