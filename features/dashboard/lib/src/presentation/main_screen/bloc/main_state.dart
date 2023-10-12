import 'package:core/core.dart';

class MainState extends BaseState {
  final MainStatus status;

  const MainState._({required this.status});

  MainState copyWith({
    MainStatus? status,
  }) {
    return MainState._(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];

  factory MainState.create() => const MainState._(status: MainStatus.initial);
}

enum MainStatus { initial }
