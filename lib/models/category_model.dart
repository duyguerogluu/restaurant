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

import 'category_item_model.dart';

class Category {
  final String categoryName;
  final String categoryDesc;
  final List<CategoryItem> categoryItems;

  Category({
    required this.categoryName,
    required this.categoryDesc,
    required this.categoryItems,
  });

  factory Category.fromJsonData(Map<String, dynamic> data) => Category(
        categoryName: data['name'],
        categoryDesc: data['desc'],
        categoryItems: (data['items'] as List)
            .map(
              (e) => CategoryItem.fromJsonData(e),
            )
            .toList(),
      );
}
