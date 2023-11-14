import 'package:flutter/material.dart';
import 'package:restaurant/models/category_item_mmodel.dart';
import 'package:restaurant/models/menu_by_category_model.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';
import 'package:restaurant/service/service.dart';

class MenuByCategoryRiverpod extends ChangeNotifier {
  Future<List<MenuByCategoryModel>?> menuByCategoryCall(int category) async {
    debugPrint("getMenuByCategory çalıştııı !!!!!!!!!!!!!!!!!");

    try {
      var value = await Service.menuByCategoryCall(category);

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
}
