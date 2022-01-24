import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/homePage/homepage.dart';
import 'package:flutter_weather_app/screens/selectCountryPage/selectCountryPage.dart';

class PagesRoute extends StatefulWidget {
  const PagesRoute({Key? key}) : super(key: key);

  @override
  State<PagesRoute> createState() => _PagesRouteState();
}

class _PagesRouteState extends State<PagesRoute> {
  late var _currentIndex;
  late List<Widget> _pages;
  @override
  void initState() {
    _pages = [HomePage(), SelectCountryWidget()];
    _currentIndex = 0;
    // TODO: implement initState
    super.initState();
  }

  Widget ShowWidget(int index) {
    return _pages[index];
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_currentIndex.toString());
    return Scaffold(
      body: ShowWidget(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Color.fromRGBO(7, 7, 35, 1),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "orta"),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
