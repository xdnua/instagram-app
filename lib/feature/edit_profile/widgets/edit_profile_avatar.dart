import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/profile/models/user.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class EditProfileAvatar extends ConsumerWidget {
  const EditProfileAvatar({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Center(child: AssetGenImage(user.avatar).image(height: 96, width: 96)),
        const SizedBox(height: 13),
        Center(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            child: Text(
              localization.changePhoto,
              style: AppTextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: ColorConstants.verifiedBlue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 13),
        const Divider(height: 1, color: ColorConstants.divider),
      ],
    );
  }
}
