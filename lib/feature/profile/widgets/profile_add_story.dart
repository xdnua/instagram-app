import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class ProfileAddStory extends ConsumerWidget {
  const ProfileAddStory({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);

    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.borderGray, width: 1),
            borderRadius: BorderRadius.circular(48),
          ),
          child: Center(child: Assets.svgs.icAdd.svg(width: 18, height: 18)),
        ),
        const SizedBox(height: 3),
        Text(localization.newLabel, style: AppTextStyle(fontSize: 12)),
      ],
    );
  }
}
