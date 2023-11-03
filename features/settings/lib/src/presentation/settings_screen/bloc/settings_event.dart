import 'package:core/core.dart';

abstract class SettingsEvent extends BaseEvent {
  const SettingsEvent();
}

class InitSettingsBlocEvent extends SettingsEvent {
  final String previousScreen;

  const InitSettingsBlocEvent({required this.previousScreen});

  @override
  List<Object?> get props => [previousScreen];
}
