import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/screens/getStartedPage/get_started_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Controller()),
    ],
    child: MaterialApp(
      home: GetStarted(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
