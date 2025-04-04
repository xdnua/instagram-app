import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class HomeAvatarItem extends StatelessWidget {
  const HomeAvatarItem({super.key, required this.avatar, this.isLive = false});

  final String avatar;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_buildAvatar(), if (isLive) _buildLiveBadge()]);
  }

  Widget _buildAvatar() {
    return Container(
      width: 64,
      height: 64,
      margin: EdgeInsetsConstants.bottom4,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors:
              isLive
                  ? [Color(0xFFE20337), Color(0xFFC60188), Color(0xFF7700C3)]
                  : [Color(0xFFFBC147), Color(0xFFD91A46), Color(0xFFA60F93)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(child: _buildAvatarImage()),
    );
  }

  Widget _buildAvatarImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorConstants.backgroundWhite,
        border: Border.all(color: ColorConstants.backgroundWhite, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: AssetGenImage(avatar).image(),
      ),
    );
  }

  Widget _buildLiveBadge() {
    return Positioned(
      bottom: 0,
      left: 18,
      child: Container(
        width: 26,
        height: 16,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFC90083), Color(0xFFD22463), Color(0xFFE10038)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          border: Border.all(color: ColorConstants.backgroundWhite, width: 2),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            "LIVE",
            style: AppTextStyle(
              color: ColorConstants.backgroundWhite,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
