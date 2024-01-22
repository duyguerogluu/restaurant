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
import 'package:restaurant/main.dart';
import 'package:restaurant/models/offer_model.dart';
import 'package:restaurant/models/user_order_model.dart';
import 'package:restaurant/service/service.dart';

class UserOrderRiverpod extends ChangeNotifier {
  double get totalPrice {
    double out = 0;

    for (var item in MyApp.basketList) {
      out += item.fiyat ?? 0;
    }

    return out;
  }

  Future<UserOrderModel?> getUserOrder() async {
    debugPrint("getUserOrder çalıştııı !!!!!!!!!!!!!!!!!");

    try {
      var value = await Service.userOrderCall(fiyat: totalPrice);

      if (value != null) {
        return value;
      } else {
        debugPrint("Değerler null dönüyo napalımmm!!!!!!!!");
      }
    } catch (error, stackTrace) {
      debugPrint("Hata oluştu: $error");
      debugPrint(stackTrace.toString());
    }
    return null;
  }

  notifyListeners();
}
