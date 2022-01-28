import 'package:flutter_weather_app/model/forecast.dart';

class Weather {
  Forecast? forecast;

  Weather({this.forecast});

  Weather.fromJson(Map<String, dynamic> json) {
    forecast = json['forecast'] != null
        ? new Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.toJson();
    }
    return data;
  }
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();

  return data;
}
