import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_app/base/dependency/app_service.dart';
import 'package:instagram_app/base/dependency/router/utils/route_name.dart';
import 'package:instagram_app/base/dependency/router/utils/route_page.dart';
import 'package:instagram_app/shared/theme/main.dart';
import 'package:instagram_app/shared/build/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final routerService = ref.watch(AppService.router);
    final toastService = ref.watch(AppService.toast);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      builder: toastService.init(),
      navigatorObservers: [toastService.observer],
      onGenerateRoute: RoutePage.onGenerateRoute,
      navigatorKey: routerService.navigatorKey,
      initialRoute: RouteName.splash,
    );
  }
}
