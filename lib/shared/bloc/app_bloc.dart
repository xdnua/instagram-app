import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/bloc/bloc_base.dart';
import 'package:instagram_app/feature/root/enum/navigation_bottom_tab_enum.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc extends BlocBase {
  final Ref ref;

  final selectedBottomTabSubject =
      BehaviorSubject<NavigatorBottomTabEnum>.seeded(
        NavigatorBottomTabEnum.home,
      );

  final navigatorKeysMap = NavigatorBottomTabEnum.values.fold(
    {},
    (previousValue, element) =>
        previousValue..[element] = GlobalKey<NavigatorState>(),
  );

  AppBloc(this.ref);

  @override
  void dispose() {
    selectedBottomTabSubject.close();
    super.dispose();
  }

  void onBottomTabChange(NavigatorBottomTabEnum curentTab) {
    selectedBottomTabSubject.value = curentTab;
  }
}
