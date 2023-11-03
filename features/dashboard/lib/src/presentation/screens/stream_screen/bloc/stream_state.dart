import 'package:core/core.dart';

class StreamState extends BaseState {
  final String number;
  final bool isRunning;
  final StreamStatus status;

  const StreamState._({
    required this.number,
    required this.isRunning,
    required this.status,
  });

  StreamState copyWith({
    String? number,
    bool? isRunning,
    StreamStatus? status,
  }) {
    return StreamState._(
      number: number ?? this.number,
      isRunning: isRunning ?? this.isRunning,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [number, isRunning, status];

  factory StreamState.create() => const StreamState._(
        number: "",
        isRunning: false,
        status: StreamStatus.initial,
      );
}

enum StreamStatus { initial, error }
