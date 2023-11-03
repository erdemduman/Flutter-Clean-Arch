import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';

class MockRandomNumberRepository extends Mock
    implements RandomNumberRepository {}

void main() {
  late MockRandomNumberRepository mockRandomNumberRepository;
  late GetStoredRandomNumberUseCase getStoredRandomNumberUseCase;

  setUp(() {
    mockRandomNumberRepository = MockRandomNumberRepository();
    getStoredRandomNumberUseCase =
        GetStoredRandomNumberUseCase(mockRandomNumberRepository);
  });

  test('GetStoredRandomNumberUseCase returns the stored random number',
      () async {
    // Arrange
    const RandomNumberEntity expectedValue = RandomNumberEntity(number: 23);

    when(() => mockRandomNumberRepository.getStoredRandomNumber())
        .thenAnswer((_) => Future.value(expectedValue));

    // Act
    final result =
        await getStoredRandomNumberUseCase(parameter: UseCaseNoParameter());

    // Assert
    expect(result, equals(expectedValue));
    verify(() => mockRandomNumberRepository.getStoredRandomNumber()).called(1);
  });

  test('GetStoredRandomNumberUseCase throws on exception', () async {
    // Arrange
    when(() => mockRandomNumberRepository.getStoredRandomNumber())
        .thenAnswer((_) async => throw const RandomNumberException());

    // Act & Assert
    expect(
      () async =>
          await getStoredRandomNumberUseCase(parameter: UseCaseNoParameter()),
      throwsA(const RandomNumberException()),
    );
    verify(() => mockRandomNumberRepository.getStoredRandomNumber()).called(1);
  });
}
