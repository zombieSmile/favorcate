import 'package:favorcate/route/route.dart';
import 'package:favorcate/services/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
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
