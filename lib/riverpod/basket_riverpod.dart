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
