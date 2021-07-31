
import 'package:downloader4u/modules/home/widget/home_widget.dart';
import 'package:downloader4u/modules/home/widget/search_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_route.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
  
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(HomeRoute.root, child: (_, __) => HomeWidget()),
    ChildRoute(HomeRoute.search, child: (_, arg) => SearchWidget(isLink: arg.data,)),
  ];
}
