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
import 'package:restaurant/riverpod/user_order_riverpod.dart';

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
final userOrder = ChangeNotifierProvider((_) => UserOrderRiverpod());
