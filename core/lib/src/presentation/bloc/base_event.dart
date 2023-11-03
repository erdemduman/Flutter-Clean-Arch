import 'package:equatable/equatable.dart';

/// Base event that extends [Equatable]. All the events will extend this
/// abstract class.
abstract class BaseEvent extends Equatable {
  const BaseEvent();

  @override
  List<Object?> get props;
}
