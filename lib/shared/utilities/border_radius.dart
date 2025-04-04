import 'package:flutter/material.dart';

/// This function is used to get border radius base on index of list
BorderRadius getBorderRadiusBaseOnIndex({
  required int index,
  required int length,
  required double radius,
}) {
  final isFirstChild = index == 0;
  final isLastChild = index == length - 1;
  final isOnlyChild = isFirstChild && isLastChild;

  var borderRadius = BorderRadius.zero;

  if (isFirstChild && !isOnlyChild) {
    borderRadius = BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
  }

  if (isLastChild && !isOnlyChild) {
    borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }

  if (isOnlyChild) {
    borderRadius = BorderRadius.circular(radius);
  }

  return borderRadius;
}
