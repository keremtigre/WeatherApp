import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/screens/PagesRoute/PagesRoute.dart';
import 'package:flutter_weather_app/screens/get_started_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: GetStarted(),
          debugShowCheckedModeBanner: false,
        ),
      )));
}
