import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String mytitle;

  const MyAppBar({Key? key, required this.mytitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(mytitle),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}