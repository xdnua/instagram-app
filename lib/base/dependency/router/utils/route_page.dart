import 'package:flutter/widgets.dart';
import 'package:instagram_app/base/dependency/router/utils/route_name.dart';
import 'package:instagram_app/base/dependency/router/utils/route_screen.dart';

class RoutePage {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return RouteScreen.splashPageRoute(settings);
      case RouteName.auth:
        return RouteScreen.authPageRoute(settings);
      case RouteName.root:
        return RouteScreen.rootPageRoute(settings);
      case RouteName.story:
        return RouteScreen.storyPageRoute(settings);
      case RouteName.reels:
        return RouteScreen.reelsPageRoute(settings);
      case RouteName.editProfile:
        return RouteScreen.editProfilePageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateHomeRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        return RouteScreen.homePageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateSearchRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.search:
        return RouteScreen.searchPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGeneratePostRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.post:
        return RouteScreen.postPageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateFavoriteRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.favorite:
        return RouteScreen.favoritePageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }

  static Route<dynamic>? onGenerateProfileRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.profile:
        return RouteScreen.profilePageRoute(settings);
    }
    return RouteScreen.unknownPageRoute(settings);
  }
}
