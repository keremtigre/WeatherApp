import 'package:flutter_weather_app/model/condition.dart';

class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  double? maxwindMph;
  double? maxwindKph;
  double? avghumidity;
  Condition? condition;
  int? uv;

  Day(
      {this.maxtempC,
      this.mintempC,
      this.avgtempC,
      this.maxwindMph,
      this.maxwindKph,
      this.avghumidity,
      this.condition,
      this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtempC = json['avgtemp_c'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    avghumidity = json['avghumidity'];
    condition = json['condition'] != null
        ? new Condition.fromJson(json['condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maxtemp_c'] = this.maxtempC;
    data['mintemp_c'] = this.mintempC;
    data['avgtemp_c'] = this.avgtempC;
    data['maxwind_mph'] = this.maxwindMph;
    data['maxwind_kph'] = this.maxwindKph;
    data['avghumidity'] = this.avghumidity;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['uv'] = this.uv;
    return data;
  }
}
