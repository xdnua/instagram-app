import 'package:flutter/material.dart';
import 'package:instagram_app/feature/auth/auth_Screen.dart';
import 'package:instagram_app/feature/edit_profile/edit_profile_screen.dart';
import 'package:instagram_app/feature/favorite/favorite_screen.dart';
import 'package:instagram_app/feature/home/home_screen.dart';
import 'package:instagram_app/feature/post/post_screen.dart';
import 'package:instagram_app/feature/profile/profile_screen.dart';
import 'package:instagram_app/feature/reels/reels_screen.dart';
import 'package:instagram_app/feature/root/root_screen.dart';
import 'package:instagram_app/feature/search/search_screen.dart';
import 'package:instagram_app/feature/splash/splash_screen.dart';
import 'package:instagram_app/feature/story/story_screen.dart';
import 'package:instagram_app/feature/unknown/unknown_screen.dart';

class RouteScreen {
  // Splash
  static PageRoute splashPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SplashScreen(),
    );
  }

  // auth
  static PageRoute authPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const AuthScreen(),
    );
  }

  // root
  static PageRoute rootPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const RootScreen(),
    );
  }

  // home
  static PageRoute homePageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const HomeScreen(),
    );
  }

  static PageRoute searchPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SearchScreen(),
    );
  }

  static PageRoute postPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const PostScreen(),
    );
  }

  static PageRoute favoritePageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const FavoriteScreen(),
    );
  }

  static PageRoute profilePageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const ProfileScreen(),
    );
  }

  // story
  static PageRoute storyPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const StoryScreen(),
    );
  }

  // reels
  static PageRoute reelsPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const ReelsScreen(),
    );
  }

  // edit profile
  static PageRoute editProfilePageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const EditProfileScreen(),
    );
  }

  // unknown
  static PageRoute unknownPageRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const UnknownScreen(),
    );
  }
}
