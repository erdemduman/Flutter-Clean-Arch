import 'package:kiwi/kiwi.dart';

class Injector {
  static KiwiContainer container = KiwiContainer();

  static final resolve = container.resolve;

  static void registerFactory<T>(T Function(KiwiContainer) factory,
      {String? name}) {
    container.registerFactory(factory);
  }

  static void registerSingleton<T>(T Function(KiwiContainer) factory,
      {String? name}) {
    container.registerSingleton(factory);
  }
}
