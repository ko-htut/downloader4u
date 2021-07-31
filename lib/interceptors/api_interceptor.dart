import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:downloader4u/modules/home/store/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class APIInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    print("request method ${request.method}");
    HomeStore _homestore = Modular.get<HomeStore>();
    if (request.method == "GET") return request;
    
    return request.copyWith(headers: _homestore.cookie!);
  }
}
