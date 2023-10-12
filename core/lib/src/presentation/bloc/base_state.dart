import 'package:equatable/equatable.dart';

/// Base state that extends [Equatable]. All the states will extend this
/// abstract class.
abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props;
}
