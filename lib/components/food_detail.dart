import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/models/food_detail_model.dart';

class FoodDetailWidget extends StatelessWidget {
  FoodDetailModel model;
  Function setFavorite;
  Function setBasket;

  FoodDetailWidget({
    super.key,
    required this.model,
    required this.setBasket,
    required this.setFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(model.imagePath),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        model.description,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "${model.price}" + "TL",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
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
      Positioned.fill(
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                setFavorite();
                debugPrint("favorite butonuna basıldı");
              },
              icon: model.isFavorite
                  ? Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.red,
                    )
                  : Icon(CupertinoIcons.heart, color: Colors.green),
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
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8),
                    Text('Sepete Ekle'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
