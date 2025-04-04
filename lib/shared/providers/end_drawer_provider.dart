import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaffoldKeyProvider = Provider<GlobalKey<ScaffoldState>>((ref) {
  return GlobalKey<ScaffoldState>();
});

/// Provider mở Drawer
final drawerProvider = Provider<void Function()>((ref) {
  final scaffoldKey = ref.watch(scaffoldKeyProvider);
  return () {
    scaffoldKey.currentState?.openEndDrawer();
  };
});
