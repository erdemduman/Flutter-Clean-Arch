import 'package:core/core.dart';
import 'package:dashboard/src/presentation/screens/main_screen/bloc/main_bloc.dart';
import 'package:dashboard/src/presentation/screens/main_screen/bloc/main_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('MainBloc', () {
    late MockLogger mockLogger;
    late MainBloc bloc;

    setUp(() {
      mockLogger = MockLogger();
      bloc = MainBloc(mockLogger);
    });

    test('Initial state is correct', () {
      expect(bloc.state, MainState.create());
    });

    test('Init', () {
      // Act
      bloc.init(parameter: const BlocNoParameter());

      // Assert
      verify(() => mockLogger.d('Init')).called(1);
    });

    test('Dispose', () {
      // Act
      bloc.dispose();

      // Assert
      verify(() => mockLogger.d('Dispose')).called(1);
    });
  });

  group('MainState', () {
    test('copyWith', () {
      final initialState = MainState.create();

      // Test with new status
      final newState = initialState.copyWith(status: MainStatus.initial);
      expect(newState.status, MainStatus.initial);

      // Test without changing status
      final sameState = initialState.copyWith();
      expect(sameState.status, MainStatus.initial);
    });

    test('props', () {
      final initialState = MainState.create();
      expect(initialState.props, [MainStatus.initial]);
    });
  });
}
