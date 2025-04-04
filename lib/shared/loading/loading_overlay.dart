import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/constants/colors.dart';

class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final Color? barrierColor;

  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.barrierColor,
  });

  const LoadingOverlay.noBarrier({
    super.key,
    required this.child,
    required this.isLoading,
    this.barrierColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: ModalBarrier(
            dismissible: false,
            color: barrierColor ?? ColorConstants.backgroundDark.withAlpha(76),
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(76),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(28),
            child: const CupertinoActivityIndicator(
              color: ColorConstants.backgroundWhite,
              radius: 14,
            ),
          ),
        ),
      ],
    );
  }
}
