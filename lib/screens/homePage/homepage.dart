import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/screens/homePage/widgets/toggleSecondPage.dart';
import 'package:provider/src/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<bool> isSelected;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        ? Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    Color.fromRGBO(4, 81, 153, 1),
                    Color.fromRGBO(7, 7, 35, 1),
                  ],
                  center: Alignment(-1, 1),
                  focal: Alignment(0.95, -0.95),
                  focalRadius: 5.0,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: phoneheight <= 700
                          ? convertSizeheight(50)
                          : convertSizeheight(80),
                    ),
                    child: Text(
                      "San Fransisco",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: convertSizeheight(15)),
                    child: Text(
                      "28 Haziran 2022",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: convertSizeheight(20)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(22, 22, 65, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ToggleButtons(
                        constraints: BoxConstraints(
                            minWidth: convertSizeWidth(140),
                            maxWidth: convertSizeWidth(140),
                            minHeight: convertSizeheight(40),
                            maxHeight: convertSizeheight(40)),
                        selectedColor: Colors.white,
                        color: Colors.white,
                        fillColor: Color.fromRGBO(27, 134, 230, 1),
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
                  Padding(
                    padding: EdgeInsets.only(
                      top: phoneheight <= 700
                          ? convertSizeheight(1)
                          : convertSizeheight(20),
                    ),
                    child: Image.asset("assets/cloud.png",
                        width: double.infinity, height: convertSizeheight(220)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: phoneheight <= 700
                          ? convertSizeheight(1)
                          : convertSizeheight(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Temp",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(
                              height: convertSizeheight(5),
                            ),
                            Text(
                              "32°",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Wind",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(
                              height: convertSizeheight(5),
                            ),
                            Text(
                              "10km/h",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Nem",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(
                              height: convertSizeheight(5),
                            ),
                            Text(
                              "%75",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(
                        top: phoneheight <= 700
                            ? convertSizeheight(60)
                            : convertSizeheight(100),
                        left: convertSizeWidth(20),
                      ),
                      child: Text(
                        "Today",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: convertSizeheight(20)),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(27, 134, 230, 0.1)),
                              margin:
                                  EdgeInsets.only(left: convertSizeWidth(20)),
                              width: convertSizeWidth(160),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/cloud.png",
                                    height: convertSizeheight(100),
                                    width: convertSizeWidth(100),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "14.00",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: convertSizeheight(5),
                                      ),
                                      Text(
                                        "32°",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(7, 7, 35, 1),
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.school), label: "orta"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "settings"),
              ],
            ),
          )
        : ToggleSecondPage();
  }
}
