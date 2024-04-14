
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.controller,
    required this.prefixIcon,
    super.key,
  });

  final String labelText;
  final TextEditingController controller;
  final IconData prefixIcon;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      obscureText: labelText == "Password"?true:false,
      style:const TextStyle(fontFamily: 'Roboto'),
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border:const OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}

