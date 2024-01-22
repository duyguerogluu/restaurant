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
import 'package:restaurant/components/category_item.dart';
import 'package:restaurant/components/menu_data_model.dart';

class MenuScreenDeneme extends StatefulWidget {
  const MenuScreenDeneme({super.key});

  @override
  State<MenuScreenDeneme> createState() => _MenuScreenDenemeState();
}

class _MenuScreenDenemeState extends State<MenuScreenDeneme> {
  var items = MenuData.fromImportedData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: items.categories.map<Widget>((category) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.categoryName),
                  Text(category.categoryDesc),
                  CategoryGrid(
                    categoryItems: category.categoryItems,
                    gridCount: 1,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
