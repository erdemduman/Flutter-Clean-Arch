import 'package:core/core.dart';

abstract class StreamEvent extends BaseEvent {
  const StreamEvent();
}

class InitStreamBlocEvent extends StreamEvent {
  const InitStreamBlocEvent();

  @override
  List<Object?> get props => [];
}

class FetchNumberStreamEvent extends StreamEvent {
  final int maxLimit;
  final bool isRunning;

  const FetchNumberStreamEvent({
    required this.maxLimit,
    required this.isRunning,
  });

  @override
  List<Object?> get props => [maxLimit, isRunning];
}

class DisposeStreamBlocEvent extends StreamEvent {
  const DisposeStreamBlocEvent();

  @override
  List<Object?> get props => [];
}
