import 'package:flutter/widgets.dart';

import '../../../l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get strId {
    return AppLocalizations.of(this);
  }
}
