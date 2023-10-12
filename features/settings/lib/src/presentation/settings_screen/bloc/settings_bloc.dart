import 'package:core/core.dart';

import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  final Logger _logger;

  SettingsBloc(this._logger) : super(SettingsState.create()) {
    on<InitEvent>(_init);
  }

  @override
  void init({required BlocParameter parameter}) {
    _logger.d("Init");
    var param = parameter as SettingsBlocParameter;
    add(InitEvent(previousPage: param.previousPage));
  }

  @override
  void dispose() {
    _logger.d("Dispose");
  }

  void _init(
    InitEvent event,
    Emitter<SettingsState> emit,
  ) {
    _logger.d("Previous page: ${event.previousPage}");
    emit(state.copyWith(previousPage: event.previousPage));
  }
}
