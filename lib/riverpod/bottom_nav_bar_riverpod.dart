import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/screens/basket_screen.dart';
import 'package:restaurant/screens/food_detail_screen.dart';
import 'package:restaurant/screens/serial_menu_deneme_screen.dart';
import 'package:restaurant/screens/main_menu_screen.dart';
import 'package:restaurant/screens/menu_screen.dart';
import 'package:restaurant/screens/menu_screen_deneme.dart';
import 'package:restaurant/screens/users_profile_page_screen.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.home,
        color: Colors.black54,
      ),
      label: "Anasayfa",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.heart,
        color: Colors.black54,
      ),
      label: "Menü",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.bag,
        color: Colors.black54,
      ),
      label: "Sepetim",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.bag,
        color: Colors.black54,
      ),
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
      case 3:
        return "Hesabım";
      case 0:
      default:
        return "Anasayfa";
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 1:
        return MainMenuScreen();
      case 2:
        return BasketScreen();
      case 3:
        return UserProfilePageScreen();
      case 0:
      default:
        return Text("Anasayfa");
    }
  }
}
