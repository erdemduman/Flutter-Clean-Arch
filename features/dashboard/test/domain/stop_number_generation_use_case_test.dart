import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dashboard/dashboard.dart';

class MockRandomNumberRepository extends Mock
    implements RandomNumberRepository {}

void main() {
  late MockRandomNumberRepository mockRandomNumberRepository;
  late StopNumberGenerationUseCase stopNumberGenerationUseCase;

  setUp(() {
    mockRandomNumberRepository = MockRandomNumberRepository();
    stopNumberGenerationUseCase =
        StopNumberGenerationUseCase(mockRandomNumberRepository);
  });

  test('StopNumberGenerationUseCase stops number generation', () {
    // Act
    stopNumberGenerationUseCase(parameter: UseCaseNoParameter());

    // Assert
    verify(() => mockRandomNumberRepository.stopNumberGeneration()).called(1);
  });
}
