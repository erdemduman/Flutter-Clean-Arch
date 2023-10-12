import 'package:core/core.dart';

abstract class NumberEvent extends BaseEvent {
  const NumberEvent();
}

class FetchNumberEvent extends NumberEvent {
  final int maxLimit;

  const FetchNumberEvent({required this.maxLimit});
}
