import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/appbar/app_bar_widget.dart';

class AppBarHome extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final routerService = ref.watch(AppService.router);

    return AppBarWidget(
      leading: Assets.svgs.icCamera.svg(),
      title: Assets.images.instagramLogo.image(width: 105, height: 28),
      actions: [
        IconButton(
          onPressed: () => routerService.push(RouteInput.reels()),
          icon: Assets.svgs.icIgtv.svg(),
        ),
        const SizedBox(width: 18),
        Assets.svgs.icMessanger.svg(),
        const SizedBox(width: 12),
      ],
      dividerColor: ColorConstants.divider,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
