import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/toast/toast_service.dart';
import 'package:instagram_app/feature/edit_profile/providers/EditProfileFormNotifier.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:instagram_app/shared/widgets/appbar/app_bar_widget.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class EditAppBarProfile extends ConsumerWidget implements PreferredSizeWidget {
  const EditAppBarProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = ref.watch(AppService.localization);
    final editNotifier = ref.read(editProfileFormProvider.notifier);
    final toast = ref.read(AppService.toast);

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
          onPressed: () async {
            toast.showLoading(message: 'Đang lưu thay đổi...');

            try {
              // Lưu dữ liệu lên Firestore
              await editNotifier.saveChanges();

              // Cập nhật lại userProvider
              final editedUser = ref.read(editProfileFormProvider);
              ref.read(userProvider.notifier).setUser(editedUser);

              toast.closeAllLoading();
              toast.showToast(
                message: 'Cập nhật thành công!',
                type: ToastType.success,
              );

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            } catch (e) {
              toast.closeAllLoading();
              toast.showToast(
                message: 'Lỗi khi lưu: $e',
                type: ToastType.error,
              );
            }
          },
          child: Text(localization.done, style: AppTextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

bool isNewUser(UserProfile user) {
  return user.name.isEmpty ||
      user.username.isEmpty ||
      user.avatar.isEmpty ||
      user.phone.isEmpty ||
      user.gender.isEmpty ||
      user.bio.isEmpty;
}
