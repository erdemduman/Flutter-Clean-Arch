import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../base_bloc.dart';
import '../bloc_parameter.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends BaseBloc<ThemeEvent, ThemeState> {
  final Logger _logger;

  ThemeBloc(this._logger) : super(ThemeState.create()) {
    on<ToggleThemeEvent>(_toggleTheme);
  }

  @override
  void init({required BlocParameter parameter}) {
    _logger.d("Init");
  }

  @override
  void dispose() {
    _logger.d("Dispose");
  }

  void _toggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    bool isDarkTheme = !state.isDarkTheme;
    _logger.i("Theme: ${isDarkTheme ? "Dark" : "Light"}");
    emit(state.copyWith(isDarkTheme: isDarkTheme));
  }
}
