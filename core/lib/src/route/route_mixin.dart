import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin RouteMixin {
  Route getScreen(Widget child, RouteSettings settings) => Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => child, settings: settings)
      : MaterialPageRoute(builder: (context) => child, settings: settings);
}
