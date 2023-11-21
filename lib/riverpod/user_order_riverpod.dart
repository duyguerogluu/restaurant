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
