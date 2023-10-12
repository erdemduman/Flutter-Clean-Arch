import 'package:core/core.dart';

import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends BaseBloc<MainEvent, MainState> {
  final Logger _logger;

  MainBloc(this._logger) : super(MainState.create());

  @override
  void init({required BlocParameter parameter}) {
    _logger.d("Init");
  }

  @override
  void dispose() {
    _logger.d("Dispose");
  }
}
