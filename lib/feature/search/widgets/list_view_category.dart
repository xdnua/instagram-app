import 'package:flutter/material.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/feature/search/models/category.dart';
import 'package:instagram_app/feature/search/widgets/item_category.dart';

class ListViewCategory extends StatelessWidget {
  const ListViewCategory({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ItemCategory(category: categories[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 6);
        },
        itemCount: categories.length,
        padding: EdgeInsetsConstants.all8,
      ),
    );
  }
}
