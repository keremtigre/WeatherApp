import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends ChangeNotifier {
  double height = 0;
  double width = 0;
  double get phoneWidth => width;
  double get phoneheight => height;
  int secilenSehirIndex = 0;
  String secilenSehir = "";
  List<String> secilenSehirListesi = [];
  List<String> get GetSecilenSehirListesi => secilenSehirListesi;

  void SehirEkle(String sehir) {
    secilenSehirListesi.add(sehir);
    notifyListeners();
  }

  void SetSehirIndex(int index) {
    secilenSehirIndex = index;
    notifyListeners();
  }

  void SehirSil(int index) {
    if (secilenSehirListesi.length > 1) {
      if (secilenSehir == secilenSehirListesi[index]) {
        secilenSehirIndex = 0;
        setSecilenSehir(secilenSehirListesi[0]);
      }
      secilenSehirListesi.removeAt(index);
    }
    if (secilenSehirListesi.length == 1) {
      secilenSehir = secilenSehirListesi[0];
      SetSehirIndex(0);
    }
    notifyListeners();
  }

  void setSecilenSehir(String sehir) async {
    secilenSehir = sehir;
    notifyListeners();
  }

  void changePhoneSize(double gelenWidth, double gelenheight) {
    width = gelenWidth;
    height = gelenheight;
  }
}
