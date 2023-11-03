import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get random_number => 'Zufallszahl';

  @override
  String get random_number_stream => 'Zufallszahlen-Stream';

  @override
  String get max_limit => 'Maximale Anzahl';

  @override
  String get fetch_number => 'Klicken Sie, um eine Zufallszahl zu erhalten!';

  @override
  String get fetch_number_stream => 'Klicke, um jede Sekunde eine Zufallszahl zu erhalten!';

  @override
  String get stop_stream => 'Stop the number stream!';

  @override
  String get previous_screen => 'Vorherige Seite';

  @override
  String get en => 'Englisch';

  @override
  String get de => 'Deutsch';

  @override
  String get tr => 'Tuerkisch';

  @override
  String get light_theme => 'Helles Thema';

  @override
  String get dark_theme => 'Dunkles Thema';
}
