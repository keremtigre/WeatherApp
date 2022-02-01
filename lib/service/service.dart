import 'dart:convert';

import 'package:flutter_weather_app/model/weather.dart';
import 'package:http/http.dart' as http;

Future<Weather> getWeather(String sehir) async {
  final response = await http.get(Uri.parse(
      "http://api.weatherapi.com/v1/forecast.json?key=BurayaAPIKeyiniziGiriniz&q=${sehir}&days=7&aqi=no&alerts=no"));
  if (response.statusCode == 200) {
    return Weather.fromJson(json.decode(response.body));
  } else {
    throw Exception("Veri gönderilmedi ${response.statusCode}");
  }
}
