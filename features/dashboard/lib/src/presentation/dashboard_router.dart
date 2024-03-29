import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/main_screen/main_screen.dart';
import 'screens/number_screen/number_screen.dart';
import 'screens/stream_screen/stream_screen.dart';

class DashboardRouter with RouteMixin implements Routable {
  @override
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.main:
        return getScreen(
          const MainScreen(parameter: BlocNoParameter()),
          settings,
        );
      case Routes.number:
        return getScreen(
          const NumberScreen(parameter: BlocNoParameter()),
          settings,
        );
      case Routes.stream:
        return getScreen(
          const StreamScreen(parameter: BlocNoParameter()),
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
