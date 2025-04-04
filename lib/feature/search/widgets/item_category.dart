import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/search/models/category.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorConstants.backgroundWhite,
        border: Border.all(color: ColorConstants.backgroundDark.withAlpha(38)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          if (category.image != null) ...[
            AssetGenSvg(category.image!).svg(),
            const SizedBox(width: 6),
          ],
          Text(
            category.title,
            style: AppTextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
