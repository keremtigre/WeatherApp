import 'package:flutter/material.dart';

Widget CreateText(String text, Color color, double fontSize) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize),
  );
}

Widget CreateText2(
    String text, Color color, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
  );
}

Widget CreateTextWithAlign(
    String text, Color color, double fontSize, TextAlign textAlign) {
  return Text(text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ));
}
