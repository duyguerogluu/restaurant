import 'package:flutter/material.dart';
import 'package:restaurant/main.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  double get totalPrice {
    double out = 0;

    for (var item in MyApp.basketList) {
      out += item.fiyat ?? 0;
    }

    return out;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: MyApp.basketList.length, // Örnek ürün sayısı
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
            title: Text(item.baslik ?? ''), // Ürün adı
            subtitle: Text(item.icerik ?? ''), // Ürün açıklaması
            trailing: Column(
              children: [
                Flexible(child: Text((item.fiyat ?? 0.0).toString())),
                const Flexible(child: SizedBox(height: 8)),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      MyApp.basketList.remove(item);
                      setState(() {});
                    },
                    child: const Text("Çıkar"),
                  ),
                ),
              ],
            ), // Ürün fiyatı
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
                child: Text('Toplam: ₺$totalPrice'), // Sepet toplam tutarı
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Ödeme işlemi
                  },
                  child: const Text('Siparişi Gönder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
