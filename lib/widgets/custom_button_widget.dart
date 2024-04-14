import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    this.buttonColor,
    this.textColor,
    required this.buttonText,
    super.key,
  });

  VoidCallback onTap;
  Color? buttonColor;
  Color? textColor;
  String buttonText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        backgroundColor:buttonColor ?? Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: 'Roboto', // Use Roboto font
          fontSize: 24,
          fontWeight: FontWeight.w200,
          color: textColor ?? Colors.white,
        ),
      ),
    );
  }
}
