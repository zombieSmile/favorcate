import 'package:favorcate/route/route.dart';
import 'package:favorcate/services/app_theme.dart';
import 'package:favorcate/viewmodel/favor_view_model.dart';
import 'package:favorcate/viewmodel/fliter_view_model.dart';
import 'package:favorcate/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FilterViewModel()),
        ChangeNotifierProvider(create: (ctx) => FavorViewModel()),
        ChangeNotifierProxyProvider<FilterViewModel, MealViewModel>(
          create: (context) => MealViewModel(),
          update: (context, filerViewModel, mealViewModel) {
            mealViewModel.filterViewModel = filerViewModel;
            return mealViewModel;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      allowFontScaling: false,
      child: MaterialApp(
        title: '美食',
        theme: AppTheme.normalTheme,
        routes: CustomRouter.routes,
        initialRoute: CustomRouter.initialRoute,
        onGenerateRoute: CustomRouter.generateRoute,
        onUnknownRoute: CustomRouter.unknownRoute,
      ),
    );
  }
}
