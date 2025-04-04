import 'package:instagram_app/base/dependency/api/api_service.dart';
import 'package:instagram_app/base/dependency/i18n/i18n_provider.dart';
import 'package:instagram_app/base/dependency/i18n/i18n_service.dart';
import 'package:instagram_app/base/dependency/local_storage/local_storage_service.dart';
import 'package:instagram_app/base/dependency/router/router_provide.dart';
import 'package:instagram_app/base/dependency/router/router_service.dart';
import 'package:instagram_app/base/dependency/toast/toast_service.dart';
import 'package:riverpod/riverpod.dart';

class AppProvider {
  static final router = Provider((ref) => RouterProvide());
  static final i18n = Provider((ref) => I18nProvider());

  AppProvider._();
}

class AppService {
  static final router = Provider((ref) {
    return RouterService(routerInterface: ref.watch(AppProvider.router));
  });

  static final i18n = Provider((ref) {
    return I18nService(
      i18nProvider: ref.watch(AppProvider.i18n),
      routerProvider: ref.watch(AppProvider.router),
    );
  });

  static final localization = Provider((ref) {
    return ref.watch(AppService.i18n).localizations;
  });

  static final api = Provider((ref) => ApiService(ref));

  static final toast = Provider((ref) => ToastService());

  static late Provider<LocalStorageService> localStorage;

  AppService._();
}
