import 'package:core/core.dart';

class SettingsState extends BaseState {
  final String previousPage;
  final SettingsStatus status;

  const SettingsState._({required this.previousPage, required this.status});

  SettingsState copyWith({
    String? previousPage,
    SettingsStatus? status,
  }) {
    return SettingsState._(
      previousPage: previousPage ?? this.previousPage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [previousPage, status];

  factory SettingsState.create() => const SettingsState._(
        previousPage: "NONE",
        status: SettingsStatus.initial,
      );
}

enum SettingsStatus { initial }
