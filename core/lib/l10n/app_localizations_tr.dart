import 'app_localizations.dart';

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get random_number => 'Rastgele Sayi';

  @override
  String get random_number_stream => 'Rastgele Sayi Akisi';

  @override
  String get max_limit => 'Ust Sinir';

  @override
  String get fetch_number => 'Rastgele bir sayi almak icin tikla!';

  @override
  String get fetch_number_stream => 'Her saniye rastgele bir sayi almak icin tikla!';

  @override
  String get stop_stream => 'Sayi akisini durdur!';

  @override
  String get previous_screen => 'Onceki sayfa';

  @override
  String get en => 'Ingilizce';

  @override
  String get de => 'Almanca';

  @override
  String get tr => 'Turkce';

  @override
  String get light_theme => 'Beyaz tema';

  @override
  String get dark_theme => 'Siyah tema';
}
