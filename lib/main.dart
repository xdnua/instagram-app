import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/local_storage/local_storage_service.dart';
import 'package:logger/logger.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/my_app.dart';

Future<void> initDependencies() async {
  await Hive.initFlutter();
  final localStorage = LocalStorageService();
  await localStorage.initialize();
  AppService.localStorage = Provider((ref) => localStorage);
}

void main() {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await initDependencies();
    runApp(const ProviderScope(child: MyApp()));
  }

  runZonedGuarded(
    () {
      startApp();
    },
    (error, stackTrace) {
      Logger().w("Có lỗi xảy ra: ${error.toString()}");
      Logger().w("Stack trace:\n$stackTrace");
    },
  );
}
