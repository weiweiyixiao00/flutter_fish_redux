import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routes/routes.dart';

Widget createApp() {
  
  return MaterialApp(
    title: '智家商城',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Routes.routes.buildPage('splash_page', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        ScreenUtil.init(context, designSize: Size(750/2, 1334/2), allowFontScaling: false);
        return Routes.routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}