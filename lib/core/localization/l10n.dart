import 'package:flutter_app/l10n/app_localizations.dart';

import '../context/global.dart';

class L10n {
  const L10n._();

  static AppLocalizations get t => AppLocalizations.of(GlobalContext.context)!;
}
