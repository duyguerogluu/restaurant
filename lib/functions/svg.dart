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

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';

class Svg extends StatelessWidget {
  const Svg({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ScalableImage.fromSvgAsset(
        rootBundle,
        path,
      ),
      builder: (c, s) => s.hasData
          ? ScalableImageWidget(si: s.data!)
          : const SizedBox.shrink(),
    );
  }
}
