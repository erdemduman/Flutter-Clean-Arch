import 'package:core/core.dart';

class StreamState extends BaseState {
  final String number;
  final StreamStatus status;

  const StreamState._({required this.number, required this.status});

  StreamState copyWith({
    String? number,
    StreamStatus? status,
  }) {
    return StreamState._(
      number: number ?? this.number,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [number, status];

  factory StreamState.create() =>
      const StreamState._(number: '23', status: StreamStatus.initial);
}

enum StreamStatus { initial, error }
