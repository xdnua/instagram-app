import 'package:flutter/cupertino.dart';
import 'package:instagram_app/shared/build/gen_l10n/app_localizations.dart';

class I18nProvider {
  AppLocalizations localizationsInstance(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}