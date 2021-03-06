import 'package:flutter/material.dart';
import 'package:flutter_weather_app/controller/controller.dart';
import 'package:flutter_weather_app/helper/data_helper.dart';
import 'package:flutter_weather_app/screens/PagesRoute/PagesRoute.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatefulWidget {
  GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  String buttonText = "";

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatDate = now.hour.toString();
    debugPrint(formatDate);
    List<String> SecilenSehirler =
        context.watch<Controller>().secilenSehirListesi;
    for (int i = 0; i < SecilenSehirler.length; i++) {
      debugPrint("Şehirle Listesi $i: " +
          SecilenSehirler[i] +
          " Seçilmiş olan şehir: " +
          Provider.of<Controller>(context, listen: false).secilenSehir +
          " -->" +
          Provider.of<Controller>(context, listen: false)
              .secilenSehirIndex
              .toString());
    }
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            if (!buttonText.isEmpty) {
              Provider.of<Controller>(context, listen: false)
                  .setSecilenSehir(buttonText);
              Provider.of<Controller>(context, listen: false)
                  .SehirEkle(buttonText);
              debugPrint(
                  Provider.of<Controller>(context, listen: false).secilenSehir);

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PagesRoute(),
                  ));
            }
          },
        ),
        body: Container(
            decoration: DataHelper().AppBackgroundColorsDecoration,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/sunny.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "WeatherApp'e Hoşgeldiniz. Lütfen Hava durumu bilgisi alacağınız şehiri seçin",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.blue.shade700,
                              title: Text(
                                "Şehir Seçiniz",
                                style: TextStyle(color: Colors.white),
                              ),
                              content: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 700,
                                      width: 600,
                                      child: ListView.builder(
                                          itemCount: 81,
                                          itemBuilder: (context, index) {
                                            List<String> cities =
                                                DataHelper().sehirler;
                                            cities;
                                            return InkWell(
                                              onTap: () {
                                                setState(() {});
                                                buttonText = cities[index];
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
                            );
                          });
                    },
                    child: Text(buttonText != null && !buttonText.isEmpty
                        ? buttonText
                        : "Şehir Seçiniz")),
              ],
            )),
      ),
    );
  }
}
