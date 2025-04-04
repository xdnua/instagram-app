import 'package:flutter/material.dart';
import 'package:instagram_app/feature/search/widgets/search_text_field.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/appbar/app_bar_widget.dart';

class AppBarSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarWidget(
      title: const SearchTextField(),
      actions: [Assets.svgs.icLive.svg(), const SizedBox(width: 18)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
