import 'package:flutter/material.dart';
import 'package:restaurant/models/category_item_mmodel.dart';
import 'package:restaurant/service/service.dart';

class CategoryRiverpod extends ChangeNotifier {
  Future<List<CategoryItemModel>?> getCategory() async {
    debugPrint("getCategory çalıştııı !!!!!!!!!!!!!!!!!");

    try {
      var value = await Service.categoryCall();

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
