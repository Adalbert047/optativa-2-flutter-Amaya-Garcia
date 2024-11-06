import 'package:flutter/material.dart';

class MenuOption {
  String description;
  String route;
  Widget screen;
  IconData icon;

  MenuOption({required this.description, required this.route,required  this.screen, required this.icon});
}