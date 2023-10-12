import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/presentation/settings_screen/settings_screen.dart';

class SettingsRouter with RouteMixin implements Routable {
  @override
  Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.settings:
        return getScreen(
          SettingsScreen(parameter: args as SettingsBlocParameter),
          settings,
        );
      default:
        return getScreen(
          const Center(
            child: Text("There is no such route :("),
          ),
          settings,
        );
    }
  }
}
