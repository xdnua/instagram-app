import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/shared/widgets/appbar/app_bar_widget.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class EditAppBarProfile extends ConsumerWidget implements PreferredSizeWidget {
  const EditAppBarProfile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);

    return AppBarWidget(
      leading: TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text(localization.cancel, style: AppTextStyle(fontSize: 16)),
      ),
      title: Text(
        localization.editProfile,
        style: AppTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(localization.done, style: AppTextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
