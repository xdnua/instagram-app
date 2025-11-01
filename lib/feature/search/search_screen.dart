import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_app/feature/search/data/search_data.dart';
import 'package:instagram_app/feature/search/widgets/app_bar_search.dart';
import 'package:instagram_app/feature/search/widgets/list_view_category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Dữ liệu demo ảnh từ Unsplash
  final List<Map<String, dynamic>> galleries = List.generate(30, (index) {
    return {
      'imageUrl': 'https://source.unsplash.com/random/300x300?sig=$index',
      'crossAxisCellCount': (index % 3) + 1,
      'mainAxisCellCount': ((index + 1) % 3) + 1,
    };
  });

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
                    galleries.map((e) {
                      return StaggeredGridTile.count(
                        crossAxisCellCount: e['crossAxisCellCount'],
                        mainAxisCellCount: e['mainAxisCellCount'],
                        child: Image.network(
                          e['imageUrl'],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Container(color: Colors.grey[300]);
                          },
                          errorBuilder: (context, error, stack) {
                            return Container(
                              color: Colors.grey,
                              child: const Icon(Icons.error),
                            );
                          },
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
