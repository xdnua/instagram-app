import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/appbar/app_bar_widget.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AppBarReels extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarReels({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);
    return AppBarWidget(
      backgroundColor: ColorConstants.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Assets.svgs.icBack.svg(color: ColorConstants.backgroundWhite),
      ),
      title: Text(
        localization.reels,
        style: AppTextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ColorConstants.backgroundWhite,
        ),
      ),
      actions: [
        Assets.svgs.icSearch.svg(color: ColorConstants.backgroundWhite),
        const SizedBox(width: 18),
        Assets.svgs.icAdd.svg(color: ColorConstants.backgroundWhite),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
