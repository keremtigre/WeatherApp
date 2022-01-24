import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/helper/data_helper.dart';
import 'package:flutter_weather_app/screens/homePage/homepage.dart';
import 'package:flutter_weather_app/screens/homePage/widgets/text_widget.dart';
import 'package:flutter_weather_app/screens/selectCountryPage/selectCountryPage.dart';
import 'package:provider/src/provider.dart';

class ToggleSecondPage extends StatefulWidget {
  const ToggleSecondPage({Key? key}) : super(key: key);

  @override
  _ToggleSecondPageState createState() => _ToggleSecondPageState();
}

class _ToggleSecondPageState extends State<ToggleSecondPage> {
  late List<bool> isSelected;
  @override
  void initState() {
    isSelected = [false, true];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double phoneWidth = context.watch<Controller>().phoneWidth;
    double phoneheight = context.watch<Controller>().phoneheight;
    debugPrint(phoneheight.toString());

    debugPrint(phoneWidth.toString() + "," + phoneheight.toString());
    double convertSizeWidth(double value) {
      return (value / phoneWidth) * phoneWidth;
    }

    double convertSizeheight(double value) {
      return (value / phoneheight) * phoneheight;
    }

    return isSelected[1] == true
        ? SafeArea(
            child: Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: DataHelper().AppBackgroundColorsDecoration,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: convertSizeheight(50)),
                      child: CreateText("San Fransisco", Colors.white, 30),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: convertSizeheight(30)),
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
                            Text(
                              "Bugün",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Diğer Günler",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.end,
                            )
                          ],
                          isSelected: isSelected,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.only(
                          top: phoneheight <= 700
                              ? convertSizeheight(20)
                              : convertSizeheight(50),
                        ),
                        alignment: Alignment.center,
                        height: phoneheight <= 700
                            ? convertSizeheight(420)
                            : convertSizeheight(460),
                        width: convertSizeWidth(350),
                        child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: index == 0
                                        ? Colors.blue.shade700
                                        : Color.fromRGBO(27, 134, 230, 0.1)),
                                margin:
                                    EdgeInsets.only(top: convertSizeWidth(20)),
                                width: convertSizeWidth(160),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CreateTextWithAlign(
                                        "14.00",
                                        Colors.white,
                                        20,
                                        TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: CreateTextWithAlign(
                                        " 10° / 32°",
                                        Colors.white,
                                        20,
                                        TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.asset(
                                        "assets/cloud.png",
                                        height: convertSizeheight(100),
                                        width: convertSizeWidth(100),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        : HomePage();
  }
}
