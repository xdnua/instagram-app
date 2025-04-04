import 'package:flutter/material.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/constants/size_box.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class ErrorText extends StatelessWidget {
  final String? text;
  final EdgeInsets? padding;

  const ErrorText({super.key, this.text, this.padding});

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return SizedBoxConstants.shrink;
    }
    return Container(
      padding: padding ?? EdgeInsetsConstants.left8,
      child: Text(text!, style: const AppTextStyle.error()),
    );
  }
}
