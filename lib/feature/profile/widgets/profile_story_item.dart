import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/feature/profile/models/profile_story.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class ProfileStoryItem extends StatelessWidget {
  const ProfileStoryItem({super.key, required this.profileStory});

  final ProfileStory profileStory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.borderGray, width: 1),
            borderRadius: BorderRadius.circular(48),
          ),
          child: Center(
            child: AssetGenImage(
              profileStory.image,
            ).image(width: 54, height: 54),
          ),
        ),
        const SizedBox(height: 3),
        Text(profileStory.title, style: AppTextStyle(fontSize: 12)),
      ],
    );
  }
}
