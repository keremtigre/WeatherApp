import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/homePage/homepage.dart';
import 'package:flutter_weather_app/screens/selectCountryPage/selectCountryPage.dart';

Widget NavigationBarOnTap(int index) {
  if (index == 0) {
    return HomePage();
  } else {
    return SelectCountryWidget();
  }
}
