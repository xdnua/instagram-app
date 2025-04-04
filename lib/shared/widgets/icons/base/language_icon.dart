import 'package:flutter/material.dart';
import 'package:instagram_app/shared/widgets/icons/base/svg_icon.dart';

class LanguageIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const LanguageIcon({super.key, this.width, this.assetName = 'language'});

  @override
  Widget build(BuildContext context) {
    return SvgIcon(assetName: assetName, width: width);
  }
}
