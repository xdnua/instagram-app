import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/providers/end_drawer_provider.dart';
import 'package:instagram_app/shared/widgets/appbar/app_bar_widget.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AppBarProfile extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarProfile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, ref) {
    final openDrawer = ref.read(drawerProvider);

    return AppBarWidget(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.svgs.icPrivate.svg(),
          Padding(
            padding: EdgeInsetsConstants.horizontal4,
            child: Text(
              title,
              style: AppTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Assets.svgs.icAccounts.svg(),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => openDrawer(),
          icon: Assets.svgs.icMenu.svg(),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
