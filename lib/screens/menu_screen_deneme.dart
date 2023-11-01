import 'package:flutter/material.dart';
import 'package:restaurant/components/category_item.dart';
import 'package:restaurant/components/menu_data_model.dart';

class MenuScreenDeneme extends StatefulWidget {
  const MenuScreenDeneme({super.key});

  @override
  State<MenuScreenDeneme> createState() => _MenuScreenDenemeState();
}

class _MenuScreenDenemeState extends State<MenuScreenDeneme> {
  var items = MenuData.fromImportedData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: items.categories.map<Widget>((category) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(category.categoryName),
                  Text(category.categoryDesc),
                  CategoryGrid(
                    categoryItems: category.categoryItems,
                    gridCount: 1,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
