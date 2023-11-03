import '../base_state.dart';

class ThemeState extends BaseState {
  final bool isDarkTheme;
  final ThemeStatus status;

  const ThemeState._({required this.isDarkTheme, required this.status});

  ThemeState copyWith({
    bool? isDarkTheme,
    ThemeStatus? status,
  }) {
    return ThemeState._(
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [isDarkTheme, status];

  factory ThemeState.create() =>
      const ThemeState._(isDarkTheme: false, status: ThemeStatus.initial);
}

enum ThemeStatus { initial }
