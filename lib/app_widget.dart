//  app_widget.dart

import 'package:downloader4u/error/unexpect_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_routes.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {

    void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return UnexpectErrorWidget(errorDetails: errorDetails);
    };
  }
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // statusBarIconBrightness: Brightness.light,
    ));

    
    setErrorBuilder();
    return MaterialApp(
      builder: (BuildContext context, widget) {
        setErrorBuilder();
        return widget!;
      },
      initialRoute: AppRoutes.root,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        textTheme: ThemeData.light().textTheme.apply(fontFamily: 'pyidaungsu'),
      ),
    ).modular();
  }
}
