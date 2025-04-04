import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/bloc/bloc_provider.dart';
import 'package:instagram_app/base/rx/obs_builder.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/root/enum/navigation_bottom_tab_enum.dart';

class AppBottomNavigationBar extends ConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appBloc = ref.watch(BlocProvider.app);

    return ObsBuilder(
      streams: [appBloc.selectedBottomTabSubject],
      builder:
          (ctx) => BottomNavigationBar(
            backgroundColor: ColorConstants.backgroundWhite,
            currentIndex: NavigationBottomTabExtension.toIndex(
              appBloc.selectedBottomTabSubject.value,
            ),
            type: BottomNavigationBarType.fixed,
            onTap:
                (index) => appBloc.onBottomTabChange(
                  NavigationBottomTabExtension.fromIndex(index),
                ),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: 'Add Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
    );
  }
}
