import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/toast/toast_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:instagram_app/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class EditProfileAvatar extends ConsumerWidget {
  const EditProfileAvatar({super.key});

  Future<void> _pickAndUploadImage(
    BuildContext context,
    WidgetRef ref,
    String uid,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    final toast = ref.read(AppService.toast);
    toast.showLoading(message: 'Uploading avatar...');

    try {
      final file = pickedFile.readAsBytes();
      final storageRef = FirebaseStorage.instance.ref().child(
        'avatars/$uid.jpg',
      );
      await storageRef.putData(await file);
      final downloadUrl = await storageRef.getDownloadURL();

      // Cập nhật Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'avatar': downloadUrl,
      });

      // Cập nhật state
      final user = ref.read(userProvider);
      ref
          .read(userProvider.notifier)
          .setUser(user.copyWith(avatar: downloadUrl));

      toast.closeAllLoading();
      toast.showToast(message: 'Avatar updated!', type: ToastType.success);
    } catch (e) {
      toast.closeAllLoading();
      toast.showToast(message: 'Update failed: $e', type: ToastType.error);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = ref.watch(AppService.localization);
    final user = ref.watch(userProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFC7C7CC), width: 1.5),
            borderRadius: BorderRadius.circular(48),
          ),
          child: Center(
            child: ClipOval(
              child:
                  user.avatar.isNotEmpty
                      ? AppCircleAvatar(url: user.avatar, width: 96, height: 96)
                      : const Icon(Icons.person, size: 96),
            ),
          ),
        ),
        const SizedBox(height: 13),
        Center(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _pickAndUploadImage(context, ref, user.uid),
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
