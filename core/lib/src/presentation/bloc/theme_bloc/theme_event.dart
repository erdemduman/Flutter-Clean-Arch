import '../base_event.dart';

abstract class ThemeEvent extends BaseEvent {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {}
