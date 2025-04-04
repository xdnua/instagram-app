import 'package:flutter/material.dart';

class ListUtils {
  static List<Widget> listSeparated<T>({
    required int itemCount,
    required Function(int index) itemBuilder,
    required Function(int index) separatorBuilder,
  }) {
    final result = <Widget>[];
    for (var i = 0; i < itemCount; i++) {
      result.add(itemBuilder(i));
      if (i < itemCount - 1) {
        result.add(separatorBuilder(i));
      }
    }
    return result;
  }
}
