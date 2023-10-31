import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasketScreen extends ConsumerStatefulWidget {
  const BasketScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BasketScreenState();
}

class _BasketScreenState extends ConsumerState<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sepetim'),
      ),
      body: ListView.builder(
        itemCount: 5, // Örnek ürün sayısı
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/product_image.png'), // Ürün resmi
            ),
            title: Text('Ürün adı'), // Ürün adı
            subtitle: Text('Ürün açıklaması'), // Ürün açıklaması
            trailing: Text('₺20'), // Ürün fiyatı
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
                  child: Text('Ödeme Yap'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
