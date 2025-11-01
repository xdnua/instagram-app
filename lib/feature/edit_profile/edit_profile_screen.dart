import 'package:flutter/material.dart';
import 'package:instagram_app/feature/edit_profile/widgets/edit_app_bar_profile.dart';
import 'package:instagram_app/feature/edit_profile/widgets/edit_profile_avatar.dart';
import 'package:instagram_app/feature/edit_profile/widgets/edit_profile_common_info.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditAppBarProfile(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [EditProfileAvatar(), EditProfileCommonInfo()],
        ),
      ),
    );
  }
}
