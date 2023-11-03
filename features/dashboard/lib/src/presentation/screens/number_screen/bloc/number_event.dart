import 'package:core/core.dart';

abstract class NumberEvent extends BaseEvent {
  const NumberEvent();
}

class InitNumberBlocEvent extends NumberEvent {
  const InitNumberBlocEvent();

  @override
  List<Object?> get props => [];
}

class FetchNumberEvent extends NumberEvent {
  final int maxLimit;

  const FetchNumberEvent({required this.maxLimit});

  @override
  List<Object?> get props => [maxLimit];
}
