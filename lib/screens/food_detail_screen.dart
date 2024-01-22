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

class FoodDetailScreen extends ConsumerStatefulWidget {
  const FoodDetailScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FoodDwtailScreenState();
}

class _FoodDwtailScreenState extends ConsumerState<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'food detail: ${widget.index}',
        ),
      ),
    );

    /*
    var fooddetail = ref.watch(fooddetailRiverpod);
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //bottomNavigationBar: BottomNavBar(),
      body: fooddetail.basketProducts.length == 0
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sepetiniz Boş"),
                  OutlinedButton(
                      onPressed: () {
                        ref.read(bottomNavBarRiverpod).setCurrentIndex(0);
                      },
                      child: const Text(
                        "Ürünlere Git",
                      ))
                ],
              ),
            )
          : Container(
              height: deviceHeight * 0.78,
              child: Column(
                children: [
                  Text(
                    "Sepet",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                  ListView.builder(
                    itemCount: fooddetail.favorites.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: FoodDetailWidget(
                          model: fooddetail.basketProducts[index],
                          setBasket: () {},
                          setFavorite: () => fooddetail
                              .setFavorite(fooddetail.basketProducts[index]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
    */
  }
}
