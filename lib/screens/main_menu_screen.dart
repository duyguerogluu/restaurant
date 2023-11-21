import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/models/category_item_mmodel.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';
import 'package:restaurant/screens/serial_menu_deneme_screen.dart';

class MainMenuScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<CategoryItemModel>?>(
          future: category.getCategory(),
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
              var categories = snapshot.data!;
             
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  var category = categories[index];

                  return Center(
                    child: SizedBox(
                      height: 180,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SerialMenuScreen(
                                    index: categories[index].id!.toInt())),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 253, 210, 92),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: Image.network(
                                    'https://toronto.goyazilim.com/${category.resimYolu}' ??
                                        'https://picsum.photos/512',
                                    height: 128,
                                    fit: BoxFit.cover,
                                    width: deviceWidth * 0.4,
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(height: 10),
                                ),
                                Flexible(
                                  child: Text(
                                    category.adi ?? "categoryname",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );

            }
          },
        ),
      ),
    );
  }
}
