import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/constants/edge_insets.dart';
import 'package:instagram_app/feature/home/models/post.dart';
import 'package:instagram_app/shared/build/gen/assets.gen.dart';
import 'package:instagram_app/shared/build/gen_l10n/app_localizations.dart';
import 'package:instagram_app/shared/widgets/text/app_text_style.dart';

class HomeFooterPost extends ConsumerWidget {
  const HomeFooterPost({
    super.key,
    required this.post,
    required this.selectedImageIndex,
  });

  final Post post;
  final int selectedImageIndex;

  @override
  Widget build(BuildContext context, ref) {
    final localization = ref.watch(AppService.localization);

    return Padding(
      padding: EdgeInsetsConstants.all12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActions(),
          const SizedBox(height: 10),
          _buildReactions(localization),
          const SizedBox(height: 6),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Assets.svgs.icLike.svg(),
              const SizedBox(width: 16),
              Assets.svgs.icComment.svg(),
              const SizedBox(width: 16),
              Assets.svgs.icMessanger.svg(),
            ],
          ),
        ),
        _buildImageCarouselIndicator(),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Assets.svgs.icSave.svg()],
          ),
        ),
      ],
    );
  }

  Widget _buildImageCarouselIndicator() {
    return SizedBox(
      height: 6,
      child: ListView.builder(
        itemBuilder:
            (context, index) => Container(
              margin: EdgeInsetsConstants.horizontal4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    selectedImageIndex == index
                        ? const Color(0xFF3897F0)
                        : const Color(0xFF000000).withAlpha(38),
              ),
              width: 6,
              height: 6,
            ),
        scrollDirection: Axis.horizontal,
        itemCount: post.images.length,
        shrinkWrap: true,
      ),
    );
  }

  Widget _buildReactions(AppLocalizations localization) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(post.like.avatar, width: 17, height: 17),
        ),
        const SizedBox(width: 6.5),
        RichText(
          text: TextSpan(
            style: AppTextStyle(fontSize: 13),
            children: [
              TextSpan(text: '${localization.likedBy} '),
              TextSpan(
                text: post.like.name,
                style: AppTextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(text: ' ${localization.and} '),
              TextSpan(
                text: '${post.totallike} ${localization.others}',
                style: AppTextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return RichText(
      text: TextSpan(
        style: AppTextStyle(fontSize: 13),
        children: [
          TextSpan(
            text: post.name,
            style: AppTextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(text: post.comment),
        ],
      ),
    );
  }
}
