import 'package:flutter_weather_app/model/condition.dart';

class Hour {
  String? time;
  double? tempC;
  int? isDay;
  Condition? condition;

  Hour(
    this.time,
    this.tempC,
    this.isDay,
    this.condition,
  );

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c'];
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temp_c'] = this.tempC;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    return data;
  }
}
