import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/favorite/widgets/favorite_following.dart';
import 'package:instagram_app/feature/favorite/widgets/favorite_you.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final localization = ref.watch(AppService.localization);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Column(
              children: [
                Container(
                  color: ColorConstants.backgroundWhite,
                  child: TabBar(
                    indicatorColor: ColorConstants.backgroundDark,
                    labelColor: ColorConstants.backgroundDark,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(text: localization.following),
                      Tab(text: localization.you),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [FavoriteFollowing(), FavoriteYou()],
        ),
      ),
    );
  }
}
