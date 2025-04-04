import 'package:flutter/material.dart';

class PngIcon extends StatelessWidget {
  final String assetName;
  final double? width;
  final double? height;

  const PngIcon({super.key, required this.assetName, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/$assetName.png',
      width: width,
      height: height,
    );
  }
}
