import 'package:instagram_app/base/dependency/router/utils/route_name.dart';

class RouteInput {
  String routeName;
  Object? arguments;

  RouteInput({required this.routeName, this.arguments});

  // Splash
  RouteInput.splash() : routeName = RouteName.splash;

  // Auth
  RouteInput.auth() : routeName = RouteName.auth;

  // Root
  RouteInput.root() : routeName = RouteName.root;

  // Home
  RouteInput.home() : routeName = RouteName.home;
  RouteInput.search() : routeName = RouteName.search;
  RouteInput.post() : routeName = RouteName.post;
  RouteInput.favorite() : routeName = RouteName.favorite;
  RouteInput.profile() : routeName = RouteName.profile;

  // story
  RouteInput.story() : routeName = RouteName.story;

  // reels
  RouteInput.reels() : routeName = RouteName.reels;

  // edit profile
  RouteInput.editProfile() : routeName = RouteName.editProfile;

  // Unknown
  RouteInput.unknown() : routeName = RouteName.unknown;
}
