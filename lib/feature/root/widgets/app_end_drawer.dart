import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AppEndDrawer extends ConsumerWidget {
  const AppEndDrawer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);

    return Drawer(
      backgroundColor: ColorConstants.backgroundWhite,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "s.khasanov_",
                    style: AppTextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: Assets.svgs.icHistory.svg(),
                  title: Text(
                    localization.archive,
                    style: AppTextStyle(fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Assets.svgs.icHistoryOclk.svg(),
                  title: Text(
                    localization.yourActivity,
                    style: AppTextStyle(fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Assets.svgs.icLive.svg(),
                  title: Text(
                    localization.nametag,
                    style: AppTextStyle(fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Assets.svgs.icSave.svg(),
                  title: Text(
                    localization.saved,
                    style: AppTextStyle(fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Assets.svgs.icMenuStart.svg(),
                  title: Text(
                    localization.closeFriends,
                    style: AppTextStyle(fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Assets.svgs.icAddPeople.svg(),
                  title: Text(
                    localization.discoverPeople,
                    style: AppTextStyle(fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Assets.svgs.icOpenfb.svg(),
                  title: Text(
                    localization.openFacebook,
                    style: AppTextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Assets.svgs.icSetting.svg(),
            title: Text(
              localization.settings,
              style: AppTextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
