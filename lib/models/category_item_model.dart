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

class CategoryItem {
  final String image;
  final String name;
  final String desc;
  final String extraInfo;
  final List<PriceItem> prices;

  CategoryItem({
    required this.image,
    required this.name,
    required this.desc,
    required this.extraInfo,
    required this.prices,
  });

  factory CategoryItem.fromJsonData(Map<String, dynamic> data) {
    var prices = data['prices'] as Map;
    return CategoryItem(
      image: data['image'],
      name: data['name'],
      desc: data['desc'],
      extraInfo: data['extraInfo'],
      prices: prices.keys
          .map((key) => PriceItem(type: key, price: prices[key]))
          .toList(),
    );
  }
}

class PriceItem {
  final String type;
  final double price;

  PriceItem({
    required this.type,
    required this.price,
  });
}
