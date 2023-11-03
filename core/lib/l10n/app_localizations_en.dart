import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get random_number => 'Random Number';

  @override
  String get random_number_stream => 'Random Number Stream';

  @override
  String get max_limit => 'Max Limit';

  @override
  String get fetch_number => 'Click to fetch a random number!';

  @override
  String get fetch_number_stream => 'Click to fetch a random number every second!';

  @override
  String get stop_stream => 'Stop the number stream!';

  @override
  String get previous_screen => 'Previous screen';

  @override
  String get en => 'English';

  @override
  String get de => 'German';

  @override
  String get tr => 'Turkish';

  @override
  String get light_theme => 'Light theme';

  @override
  String get dark_theme => 'Dark theme';
}
