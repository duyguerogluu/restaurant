import 'package:flutter/material.dart';
import 'package:restaurant/functions/svg.dart';

class MenuRiverpod extends ChangeNotifier {
  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String menuCardTitle() {
    switch (currentIndex) {
      case 1:
        return "Ana Yemekler";
      case 2:
        return "Ara Sıcaklar";
      case 3:
        return "Tatlılar";
      case 0:
      default:
        return "İçecekler";
    }
  }

  Widget appbarTitle() {
    switch (currentIndex) {
      case 1:
        return Svg(path: "assets/icons/burger-fries.svg");
      case 2:
        return Svg(path: "assets/icons/burger-fries.svg");
      case 3:
        return Svg(path: "assets/icons/burger-fries.svg");
      case 0:
      default:
        return Svg(path: "assets/icons/burger-fries.svg");
    }
  }
}
