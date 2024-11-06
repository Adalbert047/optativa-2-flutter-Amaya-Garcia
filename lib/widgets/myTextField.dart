import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;

  const myTextField({Key? key, required this.placeholder, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: placeholder,
        border: OutlineInputBorder()
      ),
    );
  }
}