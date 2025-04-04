import 'package:flutter/material.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/shared/widgets/divider/app_divider.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AppTextDivider extends StatelessWidget {
  final String text;
  final double height;
  final double thickness;

  const AppTextDivider({
    super.key,
    required this.text,
    this.height = 12,
    this.thickness = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AppDivider()),
        Padding(
          padding: EdgeInsetsConstants.horizontal28,
          child: Text(
            text,
            style: AppTextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0x66000000),
            ),
          ),
        ),
        Expanded(child: AppDivider()),
      ],
    );
  }
}
