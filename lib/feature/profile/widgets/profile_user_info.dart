import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/shared/build/gen_l10n/app_localizations.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';
import 'package:instagram_app/shared/widgets/avatar/app_circle_avatar.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class ProfileUserInfo extends ConsumerWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);
    final user = ref.watch(userProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsConstants.all12,
          child: Row(
            children: [
              _buildAvatar(user.avatar),
              const SizedBox(width: 20),
              Expanded(child: _buildStatistic(localization, user)),
              const SizedBox(width: 10),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsConstants.horizontal16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildName(user.name),
              const SizedBox(height: 1),
              _buildBio(user.bio),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String url) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFC7C7CC), width: 1.5),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Center(
        child: ClipOval(
          child:
              url.isNotEmpty
                  ? AppCircleAvatar(url: url, width: 96, height: 96)
                  : const Icon(Icons.person, size: 96),
        ),
      ),
    );
  }

  Widget _buildStatistic(AppLocalizations localization, UserProfile user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatisticItem(
          title: localization.post,
          value: user.postIds.length,
        ),
        _buildStatisticItem(
          title: localization.followers,
          value: user.followerIds.length,
        ),
        _buildStatisticItem(
          title: localization.following,
          value: user.followingIds.length,
        ),
      ],
    );
  }

  Widget _buildStatisticItem({required String title, required int value}) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: AppTextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: AppTextStyle(fontSize: 13, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildName(String name) {
    return Text(
      name,
      style: AppTextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBio(String bio) {
    return Text(
      bio,
      style: AppTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 17 / 12,
      ),
    );
  }
}
