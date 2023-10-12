import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';

import 'number_event.dart';
import 'number_state.dart';

class NumberBloc extends BaseBloc<NumberEvent, NumberState> {
  final GetRandomNumberUseCase _getRandomNumberUseCase;
  final Logger _logger;

  NumberBloc(this._getRandomNumberUseCase, this._logger)
      : super(NumberState.create()) {
    on<FetchNumberEvent>(_fetchNumber);
  }

  @override
  void init({required BlocParameter parameter}) {
    _logger.d("Init");
  }

  @override
  void dispose() {
    _logger.d("Dispose");
  }

  void _fetchNumber(FetchNumberEvent event, Emitter<NumberState> emit) async {
    try {
      RandomNumberEntity entity = await _getRandomNumberUseCase(
        parameter: GetRandomNumberStreamUseCaseParameter(
          maxLimit: event.maxLimit,
        ),
      );
      _logger.i("The number is: ${entity.number}");
      emit(state.copyWith(number: entity.number.toString()));
    } on RandomNumberException catch (_) {
      _logger.e("Error");
      emit(state.copyWith(status: NumberStatus.error));
    }
  }
}
