import 'package:equatable/equatable.dart';

class RandomNumberEntity extends Equatable {
  final int number;

  const RandomNumberEntity({required this.number});

  RandomNumberEntity copyWith({
    int? number,
  }) {
    return RandomNumberEntity(
      number: number ?? this.number,
    );
  }

  @override
  List<Object?> get props => [number];
}
