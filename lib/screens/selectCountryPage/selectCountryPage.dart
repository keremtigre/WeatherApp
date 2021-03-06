import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/helper/data_helper.dart';
import 'package:flutter_weather_app/model/weather.dart';
import 'package:flutter_weather_app/screens/homePage/widgets/text_widget.dart';
import 'package:flutter_weather_app/service/service.dart';
import 'package:provider/src/provider.dart';

class SelectCountryWidget extends StatefulWidget {
  const SelectCountryWidget({Key? key}) : super(key: key);

  @override
  _SelectCountryWidgetState createState() => _SelectCountryWidgetState();
}

class _SelectCountryWidgetState extends State<SelectCountryWidget> {
  String ButtonText = "";
  late List<String> SecilenSehirler;

  @override
  Widget build(BuildContext context) {
    SecilenSehirler = context.watch<Controller>().GetSecilenSehirListesi;
    double phoneWidth = context.watch<Controller>().phoneWidth;
    double phoneheight = context.watch<Controller>().phoneheight;
    double convertSizeWidth(double value) {
      return (value / phoneWidth) * phoneWidth;
    }

    double convertSizeheight(double value) {
      return (value / phoneheight) * phoneheight;
    }

    debugPrint(phoneheight.toString());
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: DataHelper().AppBackgroundColorsDecoration,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: convertSizeheight(20)),
              child: CreateText2(
                  "Şehir Ekle ve Seç", Colors.white, 25, FontWeight.w300),
            ),
            Padding(
              padding: EdgeInsets.all(convertSizeheight(20)),
              child: CreateText2(
                  "Eklemek istediğiniz şehri butondan seçebilir ardından anasayfada görünmesini istediğiniz şehrin üzerine tıklayıp seçebilirsiniz.",
                  Colors.white,
                  15,
                  FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: convertSizeWidth(10),
                        right: convertSizeWidth(10)),
                    height: convertSizeheight(30),
                    width: convertSizeWidth(300),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue.shade700)),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              backgroundColor: Colors.blue.shade700,
                              title: Text(
                                "Şehir Seçiniz",
                                style: TextStyle(color: Colors.white),
                              ),
                              content: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: convertSizeheight(800),
                                      width: convertSizeWidth(600),
                                      child: ListView.builder(
                                          itemCount: 81,
                                          itemBuilder: (context, index) {
                                            List<String> cities =
                                                DataHelper().sehirler;
                                            cities;
                                            return InkWell(
                                              onTap: () {
                                                setState(() {});
                                                ButtonText = cities[index];
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  padding: EdgeInsets.all(10),
                                                  margin: EdgeInsets.all(10),
                                                  child: Text(
                                                    cities[index],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text(
                            ButtonText.isEmpty ? "Şehir Seçiniz" : ButtonText)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        left: convertSizeWidth(10),
                        right: convertSizeWidth(10)),
                    height: convertSizeheight(30),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blue.shade700)),
                        onPressed: () {
                          setState(() {});
                          if (!ButtonText.isEmpty && ButtonText != null) {
                            context.read<Controller>().SehirEkle(ButtonText);
                            for (int i = 0; i < SecilenSehirler.length; i++) {
                              debugPrint(
                                  "Secilen sehirler $i: " + SecilenSehirler[i]);
                            }
                            ButtonText = "";
                          }
                        },
                        child: Icon(Icons.add)),
                  ),
                ),
              ],
            ),
            Expanded(
                child: SizedBox(
              height: convertSizeheight(400),
              width: convertSizeWidth(600),
              child: GridView.builder(
                itemCount: SecilenSehirler.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return FutureBuilder<Weather>(
                      future: getWeather(SecilenSehirler[index]),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String temp = snapshot
                              .data!.forecast!.forecastday![0].day!.avgtempC
                              .toString();
                          String? text = snapshot.data!.forecast!
                              .forecastday![0].day!.condition!.text;
                          String icon = "https:" +
                              snapshot.data!.forecast!.forecastday![0].day!
                                  .condition!.icon
                                  .toString();
                          return InkWell(
                            onTap: () {
                              setState(() {});
                              context
                                  .read<Controller>()
                                  .setSecilenSehir(SecilenSehirler[index]);
                              context.read<Controller>().SetSehirIndex(index);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                top: convertSizeheight(20),
                                left: convertSizeWidth(5),
                                right: convertSizeWidth(5),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: context
                                              .watch<Controller>()
                                              .secilenSehirIndex ==
                                          index
                                      ? Colors.blue.shade700
                                      : Colors.blue.withOpacity(0.2)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CreateText(
                                            "${temp}°", Colors.white, 20),
                                        CreateText2(text!, Colors.white, 18,
                                            FontWeight.w300),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: convertSizeWidth(8)),
                                          child: CreateTextWithAlign(
                                              SecilenSehirler[index],
                                              Colors.white,
                                              phoneWidth > 300 ? 16 : 13,
                                              TextAlign.center),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            icon,
                                            height: convertSizeheight(250),
                                            width: convertSizeWidth(250),
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: phoneWidth > 300
                                                          ? convertSizeheight(
                                                              40)
                                                          : convertSizeheight(
                                                              20),
                                                      left: phoneWidth > 300
                                                          ? convertSizeWidth(40)
                                                          : convertSizeWidth(
                                                              20)),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {});
                                                      context
                                                          .read<Controller>()
                                                          .SehirSil(index);
                                                      for (int i = 0;
                                                          i <
                                                              SecilenSehirler
                                                                  .length;
                                                          i++) {}
                                                    },
                                                    child: Icon(
                                                      Icons.delete_rounded,
                                                      color: Colors.red,
                                                      size:
                                                          convertSizeWidth(30),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator());
                        }
                      });
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
