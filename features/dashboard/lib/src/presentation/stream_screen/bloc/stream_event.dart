import 'package:core/core.dart';

abstract class StreamEvent extends BaseEvent {
  const StreamEvent();
}

class FetchNumberStreamEvent extends StreamEvent {
  final int maxLimit;

  const FetchNumberStreamEvent({required this.maxLimit});
}
