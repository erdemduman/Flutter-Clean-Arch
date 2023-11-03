import '../base_event.dart';

abstract class LanguageEvent extends BaseEvent {
  const LanguageEvent();
}

class ChangeLanguageEvent extends LanguageEvent {
  final String language;

  const ChangeLanguageEvent({required this.language});

  @override
  List<Object?> get props => [language];
}
