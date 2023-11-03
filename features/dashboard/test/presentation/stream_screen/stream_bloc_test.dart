import 'package:core/core.dart';
import 'package:dashboard/src/domain/use_case/get_random_number_stream_use_case.dart';
import 'package:dashboard/src/domain/use_case/get_stored_random_number_use_case.dart';
import 'package:dashboard/src/domain/use_case/stop_number_generation_use_case.dart';
import 'package:dashboard/src/presentation/screens/stream_screen/bloc/stream_bloc.dart';
import 'package:dashboard/src/presentation/screens/stream_screen/bloc/stream_event.dart';
import 'package:dashboard/src/presentation/screens/stream_screen/bloc/stream_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetStoredRandomNumberUseCase extends Mock
    implements GetStoredRandomNumberUseCase {}

class MockGetRandomNumberStreamUseCase extends Mock
    implements GetRandomNumberStreamUseCase {}

class MockStopNumberGenerationUseCase extends Mock
    implements StopNumberGenerationUseCase {}

class MockLogger extends Mock implements Logger {}

class FakeUseCaseParameter extends Fake implements UseCaseParameter {}

void main() {
  group("StreamBloc", () {
    late MockGetStoredRandomNumberUseCase mockGetStoredRandomNumberUseCase;
    late MockGetRandomNumberStreamUseCase mockGetRandomNumberStreamUseCase;
    late MockStopNumberGenerationUseCase mockStopNumberGenerationUseCase;
    late Logger mockLogger;
    late StreamBloc bloc;

    setUp(() {
      mockGetStoredRandomNumberUseCase = MockGetStoredRandomNumberUseCase();
      mockGetRandomNumberStreamUseCase = MockGetRandomNumberStreamUseCase();
      mockStopNumberGenerationUseCase = MockStopNumberGenerationUseCase();
      mockLogger = MockLogger();

      bloc = StreamBloc(
        mockGetStoredRandomNumberUseCase,
        mockGetRandomNumberStreamUseCase,
        mockStopNumberGenerationUseCase,
        mockLogger,
      );

      registerFallbackValue(FakeUseCaseParameter());
    });

    test('Initial state is correct', () {
      expect(bloc.state, StreamState.create());
    });

    test('Init', () {
      // Arrange
      final state = StreamState.create();
      when(() => mockGetStoredRandomNumberUseCase(
              parameter: any(named: 'parameter')))
          .thenAnswer((_) async => const RandomNumberEntity(number: 23));

      // Act
      bloc.init(parameter: const BlocNoParameter());

      // Assert
      verify(() => mockLogger.d("Init")).called(1);
      expectLater(bloc.stream, emits(state.copyWith(number: 23.toString())));
    });

    test('FetchNumberStreamEvent gets stream of numbers and emits them',
        () async {
      // Arrange
      final state = StreamState.create();
      final isRunningState = state.copyWith(isRunning: true);
      when(() => mockGetRandomNumberStreamUseCase(
          parameter: any(named: 'parameter'))).thenAnswer(
        (_) => Stream.fromIterable([
          const RandomNumberEntity(number: 23),
          const RandomNumberEntity(number: 33),
          const RandomNumberEntity(number: 91),
        ]),
      );

      // Act
      bloc.add(const FetchNumberStreamEvent(maxLimit: 100, isRunning: true));

      // Assert
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isRunningState,
          isRunningState.copyWith(number: 23.toString()),
          isRunningState.copyWith(number: 33.toString()),
          isRunningState.copyWith(number: 91.toString()),
        ]),
      );
    });

    test('FetchNumberEvent emits isRunning false when the event is suspended',
        () async {
      // Arrange
      final state = StreamState.create();

      // Act
      bloc.add(const FetchNumberStreamEvent(maxLimit: 50, isRunning: false));

      // Assert
      await expectLater(
        bloc.stream,
        emits(state.copyWith(isRunning: false)),
      );
    });

    test('FetchNumberStreamEvent throws RandomNumberException', () async {
      // Arrange
      final state = StreamState.create();
      when(() => mockGetRandomNumberStreamUseCase(
              parameter: any(named: 'parameter')))
          .thenThrow(const RandomNumberException());

      // Act
      bloc.add(const FetchNumberStreamEvent(maxLimit: 50, isRunning: true));

      // Assert
      await expectLater(
        bloc.stream,
        emits(state.copyWith(status: StreamStatus.error)),
      );
    });

    test('Dispose', () {
      // Act
      bloc.dispose();

      // Assert
      verify(() => mockLogger.d('Dispose')).called(1);
    });
  });

  group('StreamEvent', () {
    test('InitStreamBlocEvent props', () {
      InitStreamBlocEvent event = const InitStreamBlocEvent();

      expect(event.props, []);
    });

    test('FetchNumberStreamEvent props', () {
      FetchNumberStreamEvent event =
          const FetchNumberStreamEvent(maxLimit: 50, isRunning: true);

      expect(event.props, [50, true]);
    });
  });
}
