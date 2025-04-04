import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/bloc/bloc_provider.dart';
import 'package:instagram_app/base/dependency/router/utils/route_page.dart';
import 'package:instagram_app/base/rx/obs_builder.dart';
import 'package:instagram_app/feature/root/enum/navigation_bottom_tab_enum.dart';
import 'package:instagram_app/feature/root/widgets/app_bottom_navigation_bar.dart';
import 'package:instagram_app/feature/root/widgets/app_end_drawer.dart';
import 'package:instagram_app/shared/providers/end_drawer_provider.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
