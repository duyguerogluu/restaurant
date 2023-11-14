import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/riverpod/announcement_riverpod.dart';
import 'package:restaurant/riverpod/basket_riverpod.dart';
import 'package:restaurant/riverpod/bottom_nav_bar_riverpod.dart';
import 'package:restaurant/riverpod/category_riverpod.dart';
import 'package:restaurant/riverpod/food_detail_riverpod.dart';
import 'package:restaurant/riverpod/login_riverpod.dart';
import 'package:restaurant/riverpod/menu_by_category_riverpod.dart';
import 'package:restaurant/riverpod/offer_riverpod.dart';
import 'package:restaurant/riverpod/signup_riverpod.dart';

final fooddetailRiverpod = ChangeNotifierProvider((_) => FoodDetailRiverpod());
final bottomNavBarRiverpod =
    ChangeNotifierProvider((_) => BottomNavBarRiverpod());
final login = LoginRiverpod();
final announcement = AnnouncementRiverpod();
final category = CategoryRiverpod();
final offer = OfferRiverpod();
final menuByCategory = MenuByCategoryRiverpod();
final basketRiverpodd = ChangeNotifierProvider((_) => BasketRiverpod());
final signup = ChangeNotifierProvider((_) => SignupRiverpod());
