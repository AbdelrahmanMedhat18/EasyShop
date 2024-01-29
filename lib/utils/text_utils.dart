
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color ;
  final TextDecoration textDecoration;
  const TextUtils({super.key, required this.text, required this.fontSize, required this.fontWeight, required this.color, required this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
          style: TextStyle(

              decoration: textDecoration,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,

        ),
        text
    );
  }
}
