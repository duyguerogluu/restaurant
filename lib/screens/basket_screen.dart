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
import 'package:restaurant/main.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';

class BasketScreen extends ConsumerStatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends ConsumerState<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(userOrder);
    var read = ref.read(userOrder);
    return Scaffold(
      body: ListView.builder(
        itemCount: MyApp.basketList.length,
        itemBuilder: (BuildContext context, int index) {
          var item = MyApp.basketList[index];

          return ListTile(
            leading: const CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(
                // buraya item.resimYolu gelecek
                "https://i.stack.imgur.com/l60Hf.png",
              ),
            ),
            title: Text(item.baslik ?? ''),
            subtitle: Text(item.icerik ?? ''),
            trailing: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Text((item.fiyat ?? 0.0).toString()),
                ),
                Flexible(child: const SizedBox(height: 8)),
                Flexible(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      MyApp.basketList.remove(item);
                      setState(
                          () {}); // setState gerekmiyor, çünkü ConsumerWidget kullanıyoruz
                    },
                    child: const Text("Çıkar"),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Toplam: ₺${read.totalPrice.toDouble()}' ?? '0.0'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    watch.getUserOrder();
                  },
                  child: const Text(
                    'Siparişi Gönder',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
