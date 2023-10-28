import 'package:restaurant/components/imported_data.dart';
import 'package:restaurant/models/category_model.dart';

class MenuData {
  final List<Category> categories;

  MenuData({required this.categories});

  factory MenuData.fromJsonData(List<Map<String, dynamic>> data) => MenuData(
        categories: data
            .map<Category>(
              (e) => Category.fromJsonData(e),
            )
            .toList(),
      );

  factory MenuData.fromImportedData() => MenuData.fromJsonData(data);
}
