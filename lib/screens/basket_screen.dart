import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/main.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: MyApp.basketList.length, // Örnek ürün sayısı
        itemBuilder: (BuildContext context, int index) {
          var item = MyApp.basketList[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 32,
              backgroundImage:
                  NetworkImage("https://i.stack.imgur.com/l60Hf.png"),
            ),
            title: Text(item.baslik ?? ''), // Ürün adı
            subtitle: Text(item.icerik ?? ''), // Ürün açıklaması
            trailing: Column(
              children: [
                Flexible(child: Text((item.fiyat ?? 0.0).toString())),
                Flexible(
                    child: SizedBox(
                  height: 8,
                )),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      MyApp.basketList.remove(item);
                      setState(() {});
                    },
                    child: Text("Çıkar"),
                  ),
                ),
              ],
            ), // Ürün fiyatı
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Toplam: ₺100'), // Sepet toplam tutarı
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Ödeme işlemi
                  },
                  child: Text('Siparişi Gönder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
