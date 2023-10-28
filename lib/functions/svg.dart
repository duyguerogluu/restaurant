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
