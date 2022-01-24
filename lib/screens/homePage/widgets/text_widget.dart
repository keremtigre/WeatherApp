import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CreateText(String text, Color color, double fontSize) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize),
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
