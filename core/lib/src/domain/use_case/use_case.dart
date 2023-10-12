import 'use_case_parameter.dart';

/// An interface to be implemented by every use case class in the application.
abstract class UseCase<T> {
  /// The method that will be implemented by the use case classes in order to
  /// complete their work.
  ///
  /// If there is no parameter to send, set [parameter] to a
  /// [UseCaseNoParameter] object.
  ///
  /// With the use of call method, it is possible to call use cases with their
  /// objects. For example:
  ///
  /// ```dart
  /// RandomUseCase randomUseCase = RandomUseCase();
  /// randomUseCase(parameter: UseCaseNoParameter());
  /// ```
  ///
  /// The code above will call the call function of RandomUseCase class.
  T call({required UseCaseParameter parameter});
}
