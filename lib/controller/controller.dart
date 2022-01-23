import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Controller extends ChangeNotifier {
  double height = 0;
  double width = 0;
  double get phoneWidth => width;
  double get phoneheight => height;

  void changePhoneSize(double gelenWidth, double gelenheight) {
    width = gelenWidth;
    height = gelenheight;
  }
}
