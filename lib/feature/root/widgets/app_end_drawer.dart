import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/services/auth_service.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class AppEndDrawer extends ConsumerWidget {
  const AppEndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = ref.watch(AppService.localization);
    final toast = ref.watch(AppService.toast);
    final localStorage = ref.watch(AppService.localStorage);
    final router = ref.watch(AppService.router);

    void showComingSoon(String feature) {
      toast.showText(message: '$feature đang được phát triển');
    }

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
                  onTap: () => showComingSoon(localization.archive),
                ),
                ListTile(
                  leading: Assets.svgs.icHistoryOclk.svg(),
                  title: Text(
                    localization.yourActivity,
                    style: AppTextStyle(fontSize: 15),
                  ),
                  onTap: () => showComingSoon(localization.yourActivity),
                ),
                ListTile(
                  leading: Assets.svgs.icLive.svg(),
                  title: Text(
                    localization.nametag,
                    style: AppTextStyle(fontSize: 15),
                  ),
                  onTap: () => showComingSoon(localization.nametag),
                ),
                ListTile(
                  leading: Assets.svgs.icSave.svg(),
                  title: Text(
                    localization.saved,
                    style: AppTextStyle(fontSize: 15),
                  ),
                  onTap: () => showComingSoon(localization.saved),
                ),
                ListTile(
                  leading: Assets.svgs.icMenuStart.svg(),
                  title: Text(
                    localization.closeFriends,
                    style: AppTextStyle(fontSize: 15),
                  ),
                  onTap: () => showComingSoon(localization.closeFriends),
                ),
                ListTile(
                  leading: Assets.svgs.icAddPeople.svg(),
                  title: Text(
                    localization.discoverPeople,
                    style: AppTextStyle(fontSize: 15),
                  ),
                  onTap: () => showComingSoon(localization.discoverPeople),
                ),
                ListTile(
                  leading: Assets.svgs.icOpenfb.svg(),
                  title: Text(
                    localization.openFacebook,
                    style: AppTextStyle(fontSize: 15),
                  ),
                  onTap: () => showComingSoon(localization.openFacebook),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.redAccent),
                  title: Text(
                    localization.logout,
                    style: AppTextStyle(fontSize: 15, color: Colors.redAccent),
                  ),
                  onTap: () async {
                    await AuthService().signOut(localStorage);
                    router.pushReplacement(RouteInput.auth());
                  },
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
            onTap: () => showComingSoon(localization.settings),
          ),
        ],
      ),
    );
  }
}
