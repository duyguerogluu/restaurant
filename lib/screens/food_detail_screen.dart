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
