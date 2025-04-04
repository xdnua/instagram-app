import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_app/constants/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.backgroundColor = ColorConstants.backgroundWhite,
    this.dividerColor,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Center(child: leading ?? const SizedBox.shrink()),
      leadingWidth: _getLeadingWidth(),
      title: title,
      actions: actions,
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor,
      bottom:
          dividerColor != null
              ? PreferredSize(
                preferredSize: Size.fromHeight(1),
                child: Divider(height: 1, thickness: 1, color: dividerColor),
              )
              : null,
    );
  }

  double _getLeadingWidth() {
    if (leading == null) return 0;
    if (leading is SvgPicture) return 48;
    return 75;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
