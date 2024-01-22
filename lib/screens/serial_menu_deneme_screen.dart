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
import 'package:restaurant/functions/duygu_nav.dart';
import 'package:restaurant/main.dart';
import 'package:restaurant/models/menu_by_category_model.dart';
import 'package:restaurant/riverpod/basket_riverpod.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';
import 'package:restaurant/screens/basket_screen.dart';
import 'package:restaurant/screens/meal_details_screen.dart';

class SerialMenuScreen extends ConsumerWidget {
  const SerialMenuScreen({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceHeight = MediaQuery.of(context).size.height;
    var basketList = ref.read(
        basketRiverpodd); // https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/ChangeNotifierProvider-class.html

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<MenuByCategoryModel>?>(
          future: menuByCategory.menuByCategoryCall(index),
          builder: (context, snapshot) {
            debugPrint("Connection State: ${snapshot.connectionState}");
            debugPrint("Has Error: ${snapshot.hasError}");
            debugPrint("Has Data: ${snapshot.hasData}");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Hata: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text("Veri bulunamadı. bulmadıııı "),
              );
            } else {
              var menuByCategories = snapshot.data!;

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ürünler",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 16),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: menuByCategories.length,
                          itemBuilder: (context, index) {
                            var model = menuByCategories[index];

                            return ListTile(
                              onTap: () => DuyguNav.push(
                                MealDetailsScreen(model: model),
                              ),
                              title: Stack(
                                children: [
                                  SizedBox(
                                    height: deviceHeight * 0.3,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: deviceHeight * 0.3,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10),
                                                    topLeft:
                                                        Radius.circular(10),
                                                  ),
                                                  child: Image.network(
                                                    fit: BoxFit.cover,
                                                    'https://toronto.goyazilim.com/${model.resimYolu}' ??
                                                        "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Flexible(
                                                      child: Text(
                                                        // model.title,
                                                        model.baslik ??
                                                            "Gimbablar",
                                                        style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        // model.description,
                                                        model.icerik ??
                                                            "dfjkhkjhfkjsdckjskjnds",
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        model.fiyat
                                                                .toString() ??
                                                            "100TL",
                                                        style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            debugPrint('Ürün sepete eklendi!');

                                            MyApp.basketList.add(model);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content:
                                                  const Text('Sepete Eklendi'),
                                              duration:
                                                  const Duration(seconds: 3),
                                              action: SnackBarAction(
                                                label: 'SEPETE GİT',
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BasketScreen()),
                                                  );
                                                },
                                              ),
                                            ));

/*
                                            var basket =
                                                ref.read(basketRiverpodd);
                                            basket.add(model); //ekledik şimdi güncellicez
                                             BasketRiverpod basketRiverpod = context.read<BasketRiverpod>();
basketRiverpod.basketList = [...basketRiverpod.basketList];
*/
                                          },
                                          style: ElevatedButton.styleFrom(
                                              // shape: RoundedRectangleBorder(
                                              //   borderRadius: BorderRadius.circular(10),
                                              // ),
                                              ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                // Icon(Icons.shopping_cart),
                                                // SizedBox(width: 8),
                                                Text('Sepete Ekle'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
