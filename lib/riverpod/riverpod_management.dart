import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:restaurant/riverpod/food_detail_riverpod.dart';

final fooddetailRiverpod = ChangeNotifierProvider((_) => FoodDetailRiverpod());
final bottomNavBarRiverpod =
    ChangeNotifierProvider((_) => BottomNavBarRiverpod());
