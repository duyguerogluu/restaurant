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
import 'package:restaurant/models/menu_by_category_model.dart';
import 'package:restaurant/service/service.dart';

class BasketRiverpod extends ChangeNotifier {
  List<MenuByCategoryModel> _basketList = [];

  void add(MenuByCategoryModel item) {
    basketList.add(item);
  }

  List<MenuByCategoryModel> get basketList => _basketList;

  set basketList(List<MenuByCategoryModel> value) {
    _basketList = value;
    notifyListeners();
  }
}
