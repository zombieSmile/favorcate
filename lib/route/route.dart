import 'package:favorcate/ui/detail/detail.dart';
import 'package:favorcate/ui/filter/filter.dart';
import 'package:favorcate/ui/main/main.dart';
import 'package:favorcate/ui/meal/meal.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static final String initialRoute = MainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    MainPage.routeName: (context) => MainPage(),
    MealPage.routeName: (context) => MealPage(),
    DetailPage.routeName: (context) => DetailPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == FilterPage.routeName) {
      return MaterialPageRoute(
        builder: (context) {
          return FilterPage();
        },
        fullscreenDialog: true,
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
