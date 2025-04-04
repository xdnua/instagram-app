import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(
              color: ColorConstants.textPrimary.withAlpha(38),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyle(fontSize: 13)),
    );
  }
}
