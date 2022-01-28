import 'package:flutter_weather_app/model/day.dart';
import 'package:flutter_weather_app/model/hour.dart';

class Forecastday {
  String? date;
  Day? day;
  List<Hour>? hour;

  Forecastday({this.date, this.day, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? new Day.fromJson(json['day']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(new Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }
    if (this.hour != null) {
      data['hour'] = this.hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
