import 'package:core/core.dart';

abstract class SettingsEvent extends BaseEvent {
  const SettingsEvent();
}

class InitEvent extends SettingsEvent {
  final String previousPage;

  const InitEvent({required this.previousPage});
}
