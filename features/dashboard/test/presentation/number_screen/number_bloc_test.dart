import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:dashboard/src/presentation/screens/number_screen/bloc/number_event.dart';
import 'package:dashboard/src/presentation/screens/number_screen/bloc/number_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetStoredRandomNumberUseCase extends Mock
    implements GetStoredRandomNumberUseCase {}

class MockGetRandomNumberUseCase extends Mock
    implements GetRandomNumberUseCase {}

class MockLogger extends Mock implements Logger {}

class FakeUseCaseParameter extends Fake implements UseCaseParameter {}

void main() {
  group("NumberBloc", () {
    late GetStoredRandomNumberUseCase mockGetStoredRandomNumberUseCase;
    late GetRandomNumberUseCase mockGetRandomNumberUseCase;
    late Logger mockLogger;
    late NumberBloc bloc;

    setUp(() {
      mockGetStoredRandomNumberUseCase = MockGetStoredRandomNumberUseCase();
      mockGetRandomNumberUseCase = MockGetRandomNumberUseCase();
      mockLogger = MockLogger();

      bloc = NumberBloc(
        mockGetStoredRandomNumberUseCase,
        mockGetRandomNumberUseCase,
        mockLogger,
      );

      registerFallbackValue(FakeUseCaseParameter());
    });

    test('Initial state is correct', () {
      expect(bloc.state, NumberState.create());
    });

    test('Init', () {
      // Arrange
      final state = NumberState.create();
      when(() => mockGetStoredRandomNumberUseCase(
              parameter: any(named: 'parameter')))
          .thenAnswer((_) async => const RandomNumberEntity(number: 23));

      // Act
      bloc.init(parameter: const BlocNoParameter());

      // Assert
      verify(() => mockLogger.d("Init")).called(1);
      expectLater(bloc.stream, emits(state.copyWith(number: 23.toString())));
    });

    test('FetchNumberEvent gets the number and emits the state', () async {
      // Arrange
      final state = NumberState.create();
      when(() => mockGetRandomNumberUseCase(parameter: any(named: 'parameter')))
          .thenAnswer((_) async => const RandomNumberEntity(number: 23));

      // Act
      bloc.add(const FetchNumberEvent(maxLimit: 50));

      // Assert
      await expectLater(
        bloc.stream,
        emits(state.copyWith(number: 23.toString())),
      );
    });

    test('FetchNumberEvent throws RandomNumberException', () async {
      // Arrange
      final state = NumberState.create();
      when(() => mockGetRandomNumberUseCase(parameter: any(named: 'parameter')))
          .thenThrow(const RandomNumberException());

      // Act
      bloc.add(const FetchNumberEvent(maxLimit: 50));

      // Assert
      await expectLater(
        bloc.stream,
        emits(state.copyWith(status: NumberStatus.error)),
      );
    });

    test('Dispose', () {
      // Act
      bloc.dispose();

      // Assert
      verify(() => mockLogger.d('Dispose')).called(1);
    });
  });

  group('NumberEvent', () {
    test('InitNumberBlocEvent props', () {
      InitNumberBlocEvent event = const InitNumberBlocEvent();

      expect(event.props, []);
    });

    test('FetchNumberEvent props', () {
      FetchNumberEvent event = const FetchNumberEvent(maxLimit: 50);

      expect(event.props, [50]);
    });
  });
}
