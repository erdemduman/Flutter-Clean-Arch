import 'dart:io';

import 'package:core/core.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    String name = settings.name ?? "";
    Map<String, Routable> routers = {
      Modules.dashboard: DashboardRouter(),
      Modules.settings: SettingsRouter(),
    };
    var routeList = name.substring(1).split('/');
    var module = routeList[0];

    switch (module) {
      case Modules.dashboard:
        return routers[Modules.dashboard]!.generateRoute(settings);
      case Modules.settings:
        return routers[Modules.settings]!.generateRoute(settings);
      default:
        return getScreen(
          const Center(
            child: Text("There is no such route :("),
          ),
          settings,
        );
    }
  }

  static Route getScreen(Widget child, RouteSettings settings) => Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => child, settings: settings)
      : MaterialPageRoute(builder: (context) => child, settings: settings);
}
