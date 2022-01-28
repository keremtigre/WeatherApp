import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/helper/data_helper.dart';
import 'package:flutter_weather_app/model/forecast.dart';
import 'package:flutter_weather_app/model/weather.dart';
import 'package:flutter_weather_app/screens/homePage/widgets/text_widget.dart';
import 'package:flutter_weather_app/screens/homePage/widgets/toggleSecondPage.dart';
import 'package:flutter_weather_app/service/service.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<bool> isSelected;
  late String secilenSehir;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    secilenSehir = context.watch<Controller>().secilenSehir;
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneheight = MediaQuery.of(context).size.height;
    context.read<Controller>().changePhoneSize(
          phoneWidth,
          phoneheight,
        );
    double convertSizeWidth(double value) {
      return (value / phoneWidth) * phoneWidth;
    }

    double convertSizeheight(double value) {
      return (value / phoneheight) * phoneheight;
    }

    return isSelected[0] == true
        ? SafeArea(
            child: Scaffold(
              body: FutureBuilder<Weather>(
                  future: getWeather(secilenSehir),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Forecast? forecast = snapshot.data!.forecast;
                      String tarih = forecast!.forecastday![0].date.toString();
                      return Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: DataHelper().AppBackgroundColorsDecoration,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: convertSizeheight(20),
                                ),
                                child:
                                    CreateText(secilenSehir, Colors.white, 30),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: convertSizeheight(8)),
                              child: CreateText(
                                  tarih.substring(8) +
                                      "." +
                                      tarih.substring(5, 7) +
                                      "." +
                                      tarih.substring(0, 4),
                                  Colors.white70,
                                  14),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: convertSizeheight(20)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(22, 22, 65, 1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ToggleButtons(
                                  constraints: BoxConstraints(
                                      minWidth: convertSizeWidth(120),
                                      maxWidth: convertSizeWidth(120),
                                      minHeight: convertSizeheight(40),
                                      maxHeight: convertSizeheight(40)),
                                  selectedColor: Colors.white,
                                  color: Colors.white,
                                  fillColor: Colors.blue.shade700,
                                  disabledColor: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  onPressed: (index) {
                                    setState(() {
                                      for (int buttonIndex = 0;
                                          buttonIndex < isSelected.length;
                                          buttonIndex++) {
                                        if (buttonIndex == index) {
                                          isSelected[buttonIndex] = true;
                                        } else {
                                          isSelected[buttonIndex] = false;
                                        }
                                      }
                                    });
                                  },
                                  children: [
                                    CreateTextWithAlign("Bugün", Colors.white,
                                        16, TextAlign.center),
                                    CreateTextWithAlign("Diğer Günler",
                                        Colors.white, 16, TextAlign.end),
                                  ],
                                  isSelected: isSelected,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: phoneheight <= 700
                                      ? convertSizeheight(1)
                                      : convertSizeheight(20),
                                ),
                                child: Image(
                                    image: NetworkImage("https:" +
                                        forecast.forecastday![0].day!.condition!
                                            .icon
                                            .toString()),
                                    width: double.infinity,
                                    height: convertSizeheight(220)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: phoneheight <= 820
                                      ? convertSizeheight(20)
                                      : convertSizeheight(60),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        CreateTextWithAlign(
                                          "Sıcaklık",
                                          Colors.white70,
                                          12,
                                          TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: convertSizeheight(5),
                                        ),
                                        CreateTextWithAlign(
                                          forecast.forecastday![0].day!.avgtempC
                                                  .toString() +
                                              "°",
                                          Colors.white,
                                          20,
                                          TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CreateTextWithAlign(
                                          "Rüzgar",
                                          Colors.white70,
                                          12,
                                          TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: convertSizeheight(5),
                                        ),
                                        CreateTextWithAlign(
                                          forecast.forecastday![0].day!
                                                  .maxwindKph
                                                  .toString() +
                                              "km/h",
                                          Colors.white,
                                          20,
                                          TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CreateTextWithAlign(
                                          "Nem",
                                          Colors.white70,
                                          12,
                                          TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: convertSizeheight(5),
                                        ),
                                        CreateTextWithAlign(
                                          "%" +
                                              forecast.forecastday![0].day!
                                                  .avghumidity
                                                  .toString(),
                                          Colors.white,
                                          20,
                                          TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(
                                  top: convertSizeWidth(40),
                                  left: convertSizeWidth(20),
                                ),
                                child: CreateTextWithAlign(
                                  "Bugün",
                                  Colors.white,
                                  21,
                                  TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(
                                    bottom: convertSizeheight(20)),
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        forecast.forecastday![0].hour!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: index == 0
                                                ? Colors.blue.shade700
                                                : Color.fromRGBO(
                                                    27, 134, 230, 0.1)),
                                        margin: EdgeInsets.only(
                                            left: convertSizeWidth(20)),
                                        width: convertSizeWidth(160),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: Image(
                                                image: NetworkImage("https:" +
                                                    forecast.forecastday![0]
                                                        .day!.condition!.icon
                                                        .toString()),
                                                height: convertSizeheight(100),
                                                width: convertSizeWidth(100),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CreateText(
                                                      forecast.forecastday![0]
                                                          .hour![index].time!
                                                          .toString()
                                                          .substring(11),
                                                      Colors.white,
                                                      15),
                                                  SizedBox(
                                                    height:
                                                        convertSizeheight(5),
                                                  ),
                                                  CreateTextWithAlign(
                                                      forecast
                                                              .forecastday![0]
                                                              .hour![index]
                                                              .tempC
                                                              .toString() +
                                                          "°",
                                                      Colors.white,
                                                      20,
                                                      TextAlign.center)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator());
                    }
                  }),
            ),
          )
        : ToggleSecondPage();
  }
}
