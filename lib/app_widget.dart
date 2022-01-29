//  app_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_routes.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.root,
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      
        // brightness: Brightness.dark,
        textTheme: ThemeData.light()
            .textTheme
            .apply(fontFamily: 'pyidaungsu'),
      ),
    ).modular();
  }
}
