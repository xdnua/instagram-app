import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_app/feature/search/data/search_data.dart';
import 'package:instagram_app/feature/search/widgets/app_bar_search.dart';
import 'package:instagram_app/feature/search/widgets/list_view_category.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarSearch(),
      body: Column(
        children: [
          ListViewCategory(categories: SearchData.categories),
          Expanded(
            child: SingleChildScrollView(
              child: StaggeredGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children:
                    SearchData.galleries
                        .map(
                          (e) => StaggeredGridTile.count(
                            crossAxisCellCount: e.crossAxisCellCount,
                            mainAxisCellCount: e.mainAxisCellCount,
                            child: AssetGenImage(e.image).image(),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
