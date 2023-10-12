import 'dart:async';

import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';

import 'stream_event.dart';
import 'stream_state.dart';

class StreamBloc extends BaseBloc<StreamEvent, StreamState> {
  final GetRandomNumberStreamUseCase _getRandomNumberStreamUseCase;
  final Logger _logger;
  StreamSubscription<RandomNumberEntity>? _streamSubscription;

  StreamBloc(this._getRandomNumberStreamUseCase, this._logger)
      : super(StreamState.create()) {
    on<FetchNumberStreamEvent>(_fetchNumberStream);
  }

  @override
  void init({required BlocParameter parameter}) {
    _logger.d("Init");
  }

  @override
  void dispose() {
    _logger.d("Dispose");
    _streamSubscription?.cancel();
  }

  void _fetchNumberStream(
      FetchNumberStreamEvent event, Emitter<StreamState> emit) {
    try {
      var stream = _getRandomNumberStreamUseCase(
          parameter:
              GetRandomNumberStreamUseCaseParameter(maxLimit: event.maxLimit));
      _streamSubscription = stream.listen((entity) {
        _logger.i("The number is: ${entity.number}");
        emit(
          state.copyWith(
            number: entity.number.toString(),
            status: StreamStatus.initial,
          ),
        );
      });
    } on RandomNumberException catch (_) {
      _logger.e("Error");
      emit(state.copyWith(status: StreamStatus.error));
    }
  }
}
