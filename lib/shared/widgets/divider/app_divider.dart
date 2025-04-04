import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  const AppDivider({super.key, this.height = 12, this.thickness = 0.5});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      color: ColorConstants.backgroundDark.withAlpha(204),
    );
  }
}
