import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/profile/models/user.dart';
import 'package:instagram_app/shared/build/gen_l10n/app_localizations.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class EditProfileCommonInfo extends ConsumerWidget {
  const EditProfileCommonInfo({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildRowItem(title: localization.name, value: user.name),
        _buildRowItem(title: localization.username, value: user.username),
        _buildRowItem(title: 'Website', value: user.website),
        _buildRowItem(
          title: localization.bio,
          value: user.bio,
          showDivider: false,
        ),
        Divider(color: ColorConstants.divider, height: 0.33),
        Padding(
          padding: const EdgeInsets.all(16),
          child: _buildSwitchProfession(localization),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: _buildPrivateInformation(localization),
        ),
        _buildRowItem(title: localization.email, value: user.email),
        _buildRowItem(title: localization.phone, value: user.phone),
        _buildRowItem(title: localization.gender, value: user.gender),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildPrivateInformation(AppLocalizations localization) {
    return Text(
      localization.privateInfo,
      style: AppTextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSwitchProfession(AppLocalizations localization) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Text(
        localization.switchAccount,
        style: AppTextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: ColorConstants.radioActive,
        ),
      ),
    );
  }

  Widget _buildRowItem({
    required String title,
    required String? value,
    bool showDivider = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 96,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 15, 0, 15),
            child: Text(title),
          ),
        ),
        Expanded(
          flex: 279,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 15, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value ?? title, style: AppTextStyle(fontSize: 16)),
                const SizedBox(height: 15),
                if (showDivider)
                  const Divider(color: ColorConstants.divider, height: 0.33),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
