import 'dart:io';
import '../base_state.dart';

class LanguageState extends BaseState {
  final String language;
  final LanguageStatus status;

  const LanguageState._({required this.language, required this.status});

  LanguageState copyWith({
    String? language,
    LanguageStatus? status,
  }) {
    return LanguageState._(
      language: language ?? this.language,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [language, status];

  factory LanguageState.create() => LanguageState._(
        language: Platform.localeName.split('_')[0],
        status: LanguageStatus.initial,
      );
}

enum LanguageStatus { initial }
