import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Controller extends ChangeNotifier {
  double height = 0;
  double width = 0;
  double get phoneWidth => width;
  double get phoneheight => height;
  String secilenSehir = "";
  List<String> secilenSehirListesi = [];
  List<String> get GetSecilenSehirListesi => secilenSehirListesi;

  void SehirEkle(String sehir) {
    secilenSehirListesi.add(sehir);
  }

  void SehirSil(String sehir) {
    secilenSehirListesi.remove(sehir);
  }

  void setSecilenSehir(String sehir) {
    secilenSehir = sehir;
  }

  void changePhoneSize(double gelenWidth, double gelenheight) {
    width = gelenWidth;
    height = gelenheight;
  }
}
