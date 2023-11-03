import 'package:core/core.dart';

import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends BaseBloc<SettingsEvent, SettingsState> {
  final Logger _logger;

  SettingsBloc(this._logger) : super(SettingsState.create()) {
    on<InitSettingsBlocEvent>(_init);
  }

  @override
  void init({required BlocParameter parameter}) {
    _logger.d("Init");
    var param = parameter as SettingsBlocParameter;
    add(InitSettingsBlocEvent(previousScreen: param.previousPage));
  }

  @override
  void dispose() {
    _logger.d("Dispose");
  }

  void _init(
    InitSettingsBlocEvent event,
    Emitter<SettingsState> emit,
  ) {
    _logger.d("Previous page: ${event.previousScreen}");
    emit(state.copyWith(previousScreen: event.previousScreen));
  }
}
