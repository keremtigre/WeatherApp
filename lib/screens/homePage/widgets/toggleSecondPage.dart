import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/screens/homePage/homepage.dart';
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

    debugPrint(phoneWidth.toString() + "," + phoneheight.toString());
    double convertSizeWidth(double value) {
      return (value / phoneWidth) * phoneWidth;
    }

    double convertSizeheight(double value) {
      return (value / phoneheight) * phoneheight;
    }

    return isSelected[1] == true
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
                    padding: EdgeInsets.only(top: convertSizeheight(50)),
                    child: Text(
                      "San Fransisco",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
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
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    margin: EdgeInsets.only(top: convertSizeheight(50)),
                    alignment: Alignment.center,
                    height: convertSizeheight(420),
                    width: convertSizeheight(350),
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white.withOpacity(0.1),
                            elevation: 10,
                            child: ListTile(
                              textColor: Colors.white,
                              trailing: Image.asset("assets/cloud.png"),
                              title: Text(
                                  "Salı \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t 4° / 20°"),
                            ),
                          );
                        }),
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
        : HomePage();
  }
}
