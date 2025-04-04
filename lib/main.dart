import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/my_app.dart';

void main() {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
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
