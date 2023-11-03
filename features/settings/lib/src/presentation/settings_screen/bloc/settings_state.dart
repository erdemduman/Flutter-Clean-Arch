import 'package:core/core.dart';

class SettingsState extends BaseState {
  final String previousScreen;
  final SettingsStatus status;

  const SettingsState._({
    required this.previousScreen,
    required this.status,
  });

  SettingsState copyWith({
    String? previousScreen,
    SettingsStatus? status,
  }) {
    return SettingsState._(
      previousScreen: previousScreen ?? this.previousScreen,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [previousScreen, status];

  factory SettingsState.create() => const SettingsState._(
        previousScreen: "NONE",
        status: SettingsStatus.initial,
      );
}

enum SettingsStatus { initial }
