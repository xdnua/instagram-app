import 'package:flutter/material.dart';
import 'package:instagram_app/shared/widgets/icons/base/svg_icon.dart';

class AvatarDefaultIcon extends StatelessWidget {
  final double? width;
  final String assetName;

  const AvatarDefaultIcon({
    super.key,
    this.width,
    this.assetName = 'avatar_default',
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(assetName: assetName, width: width);
  }
}
