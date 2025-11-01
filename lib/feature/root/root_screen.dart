import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/bloc/bloc_provider.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_input.dart';
import 'package:instagram_app/base/dependency/router/utils/route_page.dart';
import 'package:instagram_app/base/rx/obs_builder.dart';
import 'package:instagram_app/feature/profile/models/user_profile.dart';
import 'package:instagram_app/feature/root/enum/navigation_bottom_tab_enum.dart';
import 'package:instagram_app/feature/root/widgets/app_bottom_navigation_bar.dart';
import 'package:instagram_app/feature/root/widgets/app_end_drawer.dart';
import 'package:instagram_app/shared/providers/end_drawer_provider.dart';
import 'package:instagram_app/shared/providers/user_provider.dart';

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  ConsumerState<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends ConsumerState<RootScreen> {
  bool _hasPushedEditProfile = false; // cờ chỉ chạy 1 lần

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final routerService = ref.read(AppService.router);

    // Chỉ chạy 1 lần
    if (!_hasPushedEditProfile) {
      _hasPushedEditProfile = true;

      // Chờ 2 giây để dữ liệu user load đầy đủ
      Future.delayed(const Duration(seconds: 2), () {
        final user = ref.read(userProvider);
        if (isNewUser(user)) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            routerService.push(RouteInput.editProfile());
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = ref.watch(BlocProvider.app);
    final scaffoldKey = ref.read(scaffoldKeyProvider);

    return Scaffold(
      key: scaffoldKey,
      endDrawer: const AppEndDrawer(),
      body: Stack(
        children:
            NavigatorBottomTabEnum.values
                .map(
                  (tab) => ObsBuilder(
                    streams: [appBloc.selectedBottomTabSubject],
                    builder:
                        (ctx) => Offstage(
                          offstage:
                              tab != appBloc.selectedBottomTabSubject.value,
                          child: Navigator(
                            key: appBloc.navigatorKeysMap[tab],
                            onGenerateRoute: buildRouteFactory(tab),
                            initialRoute: tab.initialRoute,
                          ),
                        ),
                  ),
                )
                .toList(),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  RouteFactory buildRouteFactory(NavigatorBottomTabEnum tab) {
    return switch (tab) {
      NavigatorBottomTabEnum.home => RoutePage.onGenerateHomeRoute,
      NavigatorBottomTabEnum.search => RoutePage.onGenerateSearchRoute,
      NavigatorBottomTabEnum.post => RoutePage.onGeneratePostRoute,
      NavigatorBottomTabEnum.favorite => RoutePage.onGenerateFavoriteRoute,
      NavigatorBottomTabEnum.profile => RoutePage.onGenerateProfileRoute,
    };
  }
}

bool isNewUser(UserProfile user) {
  return user.name.isEmpty ||
      user.username.isEmpty ||
      user.avatar.isEmpty ||
      user.phone.isEmpty ||
      user.gender.isEmpty ||
      user.bio.isEmpty;
}
