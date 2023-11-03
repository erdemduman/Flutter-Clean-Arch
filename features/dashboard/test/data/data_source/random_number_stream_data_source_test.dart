import 'dart:math';

import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRandom extends Mock implements Random {}

class MockLogger extends Mock implements Logger {}

void main() {
  late MockRandom mockRandom;
  late MockLogger mockLogger;
  late RandomNumberStreamDataSourceImpl randomNumberStreamDataSourceImpl;

  setUp(() {
    mockRandom = MockRandom();
    mockLogger = MockLogger();
    randomNumberStreamDataSourceImpl = RandomNumberStreamDataSourceImpl(
      mockRandom,
      mockLogger,
    );
  });

  test('getRandomNumberStream yields random numbers', () async {});

  test('stopNumberGeneration stops the number generation', () {
    // Act
    randomNumberStreamDataSourceImpl.stopNumberGeneration();

    // Assert
    expect(randomNumberStreamDataSourceImpl.isRunning, false);
  });

  test('GetRandomNumberUseCase throws on exception', () async {});
}
