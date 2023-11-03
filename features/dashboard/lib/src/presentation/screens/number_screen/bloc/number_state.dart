import 'package:core/core.dart';

class NumberState extends BaseState {
  final String number;
  final NumberStatus status;

  const NumberState._({required this.number, required this.status});

  NumberState copyWith({
    String? number,
    NumberStatus? status,
  }) {
    return NumberState._(
      number: number ?? this.number,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [number, status];

  factory NumberState.create() =>
      const NumberState._(number: "", status: NumberStatus.initial);
}

enum NumberStatus { initial, error }
