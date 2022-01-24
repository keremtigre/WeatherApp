import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/screens/homePage/widgets/text_widget.dart';
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
        ? SafeArea(
            child: Scaffold(
              body: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(7, 7, 35, 1),
                      Color.fromRGBO(7, 15, 63, 1),
                      Color.fromRGBO(9, 54, 97, 1),
                    ],
                    stops: [0.5, 0.8, 1],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: convertSizeheight(20),
                        ),
                        child: CreateText("San Fransisco", Colors.white, 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: convertSizeheight(8)),
                      child: CreateText("28 Haziran 2022", Colors.white70, 14),
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
                              minWidth: convertSizeWidth(120),
                              maxWidth: convertSizeWidth(120),
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
                            CreateTextWithAlign(
                                "Bugün", Colors.white, 16, TextAlign.center),
                            CreateTextWithAlign("Diğer Günler", Colors.white,
                                16, TextAlign.end),
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
                        child: Image.asset("assets/cloud.png",
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CreateTextWithAlign(
                                  "Temp",
                                  Colors.white70,
                                  12,
                                  TextAlign.center,
                                ),
                                SizedBox(
                                  height: convertSizeheight(5),
                                ),
                                CreateTextWithAlign(
                                  "32°",
                                  Colors.white,
                                  20,
                                  TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CreateTextWithAlign(
                                  "Wind",
                                  Colors.white70,
                                  12,
                                  TextAlign.center,
                                ),
                                SizedBox(
                                  height: convertSizeheight(5),
                                ),
                                CreateTextWithAlign(
                                  "10km/h",
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
                                  "%75",
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
                          "Today",
                          Colors.white,
                          21,
                          TextAlign.center,
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
                                    Expanded(
                                      child: Image.asset(
                                        "assets/cloud.png",
                                        height: convertSizeheight(100),
                                        width: convertSizeWidth(100),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CreateText("14.00", Colors.white, 15),
                                          SizedBox(
                                            height: convertSizeheight(5),
                                          ),
                                          CreateTextWithAlign(
                                              "32°",
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
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Color.fromRGBO(7, 7, 35, 1),
                unselectedItemColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.school), label: "orta"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "settings"),
                ],
              ),
            ),
          )
        : ToggleSecondPage();
  }
}
