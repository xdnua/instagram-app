import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/feature/profile/models/user.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/build/gen_l10n/app_localizations.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class ProfileUserInfo extends ConsumerWidget {
  const ProfileUserInfo({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsetsConstants.all12,
          child: Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 20),
              Expanded(child: _buildStatistic(localization)),
              const SizedBox(width: 10),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsConstants.horizontal16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_buildName(), const SizedBox(height: 1), _buildBio()],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFC7C7CC), width: 1.5),
        borderRadius: BorderRadius.circular(48),
      ),
      child: Center(
        child: AssetGenImage(user.avatar).image(width: 90, height: 90),
      ),
    );
  }

  Widget _buildStatistic(AppLocalizations localization) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatisticItem(
          title: localization.post,
          value: user.numberOfPosts,
        ),
        _buildStatisticItem(
          title: localization.followers,
          value: user.numberOfFollowers,
        ),
        _buildStatisticItem(
          title: localization.following,
          value: user.numberOfFollowing,
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

  Widget _buildName() {
    return Text(
      user.name,
      style: AppTextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildBio() {
    return Text(
      user.bio,
      style: AppTextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 17 / 12,
      ),
    );
  }
}
