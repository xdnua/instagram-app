import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/bloc/bloc_provider.dart';
import 'package:instagram_app/base/dependency/router/router_provide.dart';
import 'package:instagram_app/base/dependency/router/router_service.dart';
import 'package:instagram_app/feature/root/enum/navigation_bottom_tab_enum.dart';

final _bottomNavigationRouterFamily = Provider.autoDispose.family((
  ref,
  NavigatorBottomTabEnum tab,
) {
  final appBloc = ref.watch(BlocProvider.app);
  final navigatorKey = appBloc.navigatorKeysMap[tab];
  return RouterService(routerInterface: RouterProvide(key: navigatorKey));
});

class BottomNavigationProvider {
  static final home = _bottomNavigationRouterFamily(
    NavigatorBottomTabEnum.home,
  );

  static final search = _bottomNavigationRouterFamily(
    NavigatorBottomTabEnum.search,
  );

  static final favorite = _bottomNavigationRouterFamily(
    NavigatorBottomTabEnum.favorite,
  );

  static final profile = _bottomNavigationRouterFamily(
    NavigatorBottomTabEnum.profile,
  );

  BottomNavigationProvider._();
}
