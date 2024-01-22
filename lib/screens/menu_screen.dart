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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/functions/svg.dart';
import 'package:restaurant/riverpod/food_detail_riverpod.dart';
import 'package:restaurant/screens/food_detail_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: fooddetails.length,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(child: MyCard(index)),
                    const SizedBox(width: 10),
                    Flexible(child: MyCard(index + 1)),
                  ],
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class MyCard extends ConsumerWidget {
  final int index;
  MyCard(this.index);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => FoodDetailScreen(index: index),
          ),
        );
      },
      child: Card(
        elevation: 5, // Gölge
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width * 0.2,
                  height: width * 0.2,
                  child: const Svg(path: "assets/icons/burger-fries.svg"),
                ),
              ), // Örnek bir ikon
              const SizedBox(height: 10),
              const Text(
                'Ana Yemek',
                style: TextStyle(fontSize: 16),
              ),
              // SizedBox(height: 10),
              // Text(
              //   'Bu bir Flutter Card widget örneğidir.',
              //   style: TextStyle(fontSize: 16),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
