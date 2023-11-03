import 'dart:async';

import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRandomNumberRepository extends Mock
    implements RandomNumberRepository {}

void main() {
  late MockRandomNumberRepository mockRandomNumberRepository;
  late GetRandomNumberStreamUseCase getRandomNumberStreamUseCase;

  setUp(() {
    mockRandomNumberRepository = MockRandomNumberRepository();
    getRandomNumberStreamUseCase =
        GetRandomNumberStreamUseCase(mockRandomNumberRepository);
  });

  test('GetRandomNumberStreamUseCase yields random entities', () async {
    // Arrange
    const int maxLimit = 100;

    final expectedStream = Stream.fromIterable([
      const RandomNumberEntity(number: 23),
      const RandomNumberEntity(number: 33),
      const RandomNumberEntity(number: 91),
    ]);

    when(() => mockRandomNumberRepository.getRandomNumberStream(maxLimit))
        .thenAnswer((_) => expectedStream);

    // Act
    final result = getRandomNumberStreamUseCase(
      parameter: GetRandomNumberStreamUseCaseParameter(maxLimit: maxLimit),
    );

    // Assert
    expectLater(
      result,
      emitsInOrder([
        const RandomNumberEntity(number: 23),
        const RandomNumberEntity(number: 33),
        const RandomNumberEntity(number: 91),
        emitsDone,
      ]),
    );
  });

  test('GetRandomNumberStreamUseCase throws RandomNumberException on exception',
      () async {
    // Arrange
    const int maxLimit = 25;

    when(() => mockRandomNumberRepository.getRandomNumberStream(maxLimit))
        .thenThrow(const RandomNumberException());

    // Act
    final result = getRandomNumberStreamUseCase(
        parameter: GetRandomNumberStreamUseCaseParameter(maxLimit: maxLimit));

    // Assert
    expect(result, emitsError(isA<RandomNumberException>()));
  });
}
