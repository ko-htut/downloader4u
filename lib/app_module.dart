import 'package:downloader4u/app_routes.dart';
import 'package:downloader4u/services/api_service.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'clients/api_client.dart';
import 'modules/home/home_module.dart';
import 'modules/home/repositories/home_repo_impl.dart';
import 'modules/home/store/home_store.dart';
import 'modules/home/store/search_store.dart';
import 'modules/splash_widget.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind((i) => Logger(printer: PrettyPrinter(methodCount: 0))),
    Bind((i) => APIClient()),
    Bind((i) => APIService.create(i.get<APIClient>())),
    Bind((i) => HomeStore()),
    Bind((i) => SearchStore()),
    Bind((i) => HomeRepositoryImpl.instance),
     Bind((i) => FirebaseRemoteConfig.instance),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(AppRoutes.root, child: (_, __) => SplashWidget()),
    ModuleRoute(
      AppRoutes.home,
      module: HomeModule(),
      
    ),
  ];
}
