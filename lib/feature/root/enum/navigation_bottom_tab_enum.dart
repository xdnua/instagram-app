import 'package:instagram_app/base/dependency/router/utils/route_name.dart';

enum NavigatorBottomTabEnum { home, search, post, favorite, profile }

extension NavigationBottomTabExtension on NavigatorBottomTabEnum {
  String get initialRoute {
    switch (this) {
      case NavigatorBottomTabEnum.home:
        return RouteName.home;
      case NavigatorBottomTabEnum.search:
        return RouteName.search;
      case NavigatorBottomTabEnum.post:
        return RouteName.post;
      case NavigatorBottomTabEnum.favorite:
        return RouteName.favorite;
      case NavigatorBottomTabEnum.profile:
        return RouteName.profile;
    }
  }

  static NavigatorBottomTabEnum fromIndex(int index) {
    switch (index) {
      case 0:
        return NavigatorBottomTabEnum.home;
      case 1:
        return NavigatorBottomTabEnum.search;
      case 2:
        return NavigatorBottomTabEnum.post;
      case 3:
        return NavigatorBottomTabEnum.favorite;
      case 4:
        return NavigatorBottomTabEnum.profile;
    }
    return NavigatorBottomTabEnum.home;
  }

  static int toIndex(NavigatorBottomTabEnum tab) {
    switch (tab) {
      case NavigatorBottomTabEnum.home:
        return 0;
      case NavigatorBottomTabEnum.search:
        return 1;
      case NavigatorBottomTabEnum.post:
        return 2;
      case NavigatorBottomTabEnum.favorite:
        return 3;
      case NavigatorBottomTabEnum.profile:
        return 4;
    }
  }
}
