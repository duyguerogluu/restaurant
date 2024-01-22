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
