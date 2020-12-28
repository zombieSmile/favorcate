import 'package:favorcate/ui/main/main.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static final String initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (ctx) => MainPage()
  };

  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
