
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.title,
    this.fontFamily,
    this.fontColor,
    this.fontSize,
    super.key,
  });

  final String title;
  final String? fontFamily;
  final Color? fontColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize ?? 32,
        fontWeight: FontWeight.bold,
        color: fontColor ?? Colors.black,
        fontFamily: fontFamily ?? "Roboto",
        letterSpacing: 2,
        wordSpacing: 4,
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
