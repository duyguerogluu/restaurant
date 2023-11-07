import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/screens/basket_screen.dart';
import 'package:restaurant/screens/serial_menu_deneme_screen.dart';

class MealDetailsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Column(
                          //mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Image.network(
                                'https://picsum.photos/512',
                                loadingBuilder: (context, child,
                                        loadingProgress) =>
                                    loadingProgress?.cumulativeBytesLoaded ==
                                            loadingProgress?.expectedTotalBytes
                                        ? child
                                        : const SizedBox(
                                            height: 128,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  CircularProgressIndicator(),
                                                ],
                                              ),
                                            ),
                                          ),
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  "Rose Debokki",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            const Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  "sebze olarak lahana,havuç ve soğan vardır. (ACI SEVİYESİ-2)",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "170TL",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 17),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('Ürün sepete eklendi!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BasketScreen()),
                          );
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
                              Text('Sipariş ver'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
