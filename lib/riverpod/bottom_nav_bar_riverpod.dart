import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/basket_screen.dart';
import 'package:restaurant/screens/food_detail_screen.dart';
import 'package:restaurant/screens/home_screen.dart';
import 'package:restaurant/screens/menu_screen.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: "Anasayfa",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.heart),
      label: "Menü",
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.bag),
      label: "Sepetim",
    ),
  ];

  int currentIndex = 0;

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String appbarTitle() {
    switch (currentIndex) {
      case 1:
        return "Menü";
      case 2:
        return "Sepetim";
      case 0:
      default:
        return "Anasayfa";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 1:
        return MenuScreen();
      case 2:
        return BasketScreen();
      case 0:
      default:
        return HomeScreen();
    }
  }
}
