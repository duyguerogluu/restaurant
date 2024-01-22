/*
 *  This file is part of restaurant.
 *
 *  restaurant is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  restaurant is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with restaurant.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/functions/duygu_nav.dart';
import 'package:restaurant/screens/announcement_screen.dart';
import 'package:restaurant/screens/basket_screen.dart';
import 'package:restaurant/screens/main_menu_screen.dart';
import 'package:restaurant/screens/users_profile_page_screen.dart';

class BottomNavBarRiverpod extends ChangeNotifier {
  BuildContext? context;
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
        CupertinoIcons.cart,
        color: Colors.black54,
      ),
      label: "Sepetim",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        CupertinoIcons.person,
        color: Colors.black54,
      ),
      label: "Profil",
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
        return "Sepetim";
      case 2:
        return "Hesabım";
      case 0:
      default:
        return "Menü";
    }
  }

  Widget appbarIcon() {
    switch (currentIndex) {
      case 1:
        return const SizedBox();
      case 2:
        return IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Color.fromARGB(255, 253, 210, 92),
          ),
          onPressed: () {
            DuyguNav.push(const AnnouncementScreen());
          },
        );
      case 0:
      default:
        return IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Color.fromARGB(255, 253, 210, 92),
          ),
          onPressed: () {
            DuyguNav.push(const AnnouncementScreen());
          },
        );
    }
  }

  Widget body() {
    switch (currentIndex) {
      case 1:
        return const BasketScreen();
      case 2:
        return const UserProfilePageScreen();
      case 0:
      default:
        return MainMenuScreen();
    }
  }
}
