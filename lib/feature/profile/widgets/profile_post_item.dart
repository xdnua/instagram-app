import 'package:flutter/material.dart';
import 'package:instagram_app/shared/widgets/avatar/app_circle_avatar.dart';

class ProfilePostItem extends StatelessWidget {
  const ProfilePostItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return AppCircleAvatar(url: 'https://picsum.photos/250?image=$index');
  }
}
