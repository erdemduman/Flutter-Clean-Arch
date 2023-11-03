import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRandomNumberRepository extends Mock
    implements RandomNumberRepository {}

void main() {
  late MockRandomNumberRepository mockRandomNumberRepository;
  late GetRandomNumberUseCase getRandomNumberUseCase;

  setUp(() {
    mockRandomNumberRepository = MockRandomNumberRepository();
    getRandomNumberUseCase = GetRandomNumberUseCase(mockRandomNumberRepository);
  });

  test('GetRandomNumberUseCase gets random entities', () async {
    // Arrange
    const int maxLimit = 25;
    const RandomNumberEntity expectedEntity = RandomNumberEntity(number: 23);

    when(() => mockRandomNumberRepository.getRandomNumber(maxLimit))
        .thenAnswer((_) async => expectedEntity);

    // Act
    final result = await getRandomNumberUseCase(
        parameter: GetRandomNumberUseCaseParameter(maxLimit: maxLimit));

    // Assert
    verify(() => mockRandomNumberRepository.getRandomNumber(maxLimit))
        .called(1);
    expect(result, equals(expectedEntity));
  });

  test('GetRandomNumberUseCase throws on exception', () async {
    // Arrange
    const int maxLimit = 25;

    when(() => mockRandomNumberRepository.getRandomNumber(maxLimit))
        .thenAnswer((_) async => throw const RandomNumberException());

    // Act & Assert
    expect(
      () async => await getRandomNumberUseCase(
        parameter: GetRandomNumberUseCaseParameter(
          maxLimit: maxLimit,
        ),
      ),
      throwsA(const RandomNumberException()),
    );
    verify(() => mockRandomNumberRepository.getRandomNumber(maxLimit))
        .called(1);
  });
}
