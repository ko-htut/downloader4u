import 'dart:io';

import 'package:chopper/src/response.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:downloader4u/model/data/link_model.dart';
import 'package:downloader4u/modules/home/repositories/home_repo.dart';
import 'package:downloader4u/services/api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeRepositoryImpl implements HomeRepository {
  //

  APIService _ApiService = Modular.get<APIService>();

  var cj = CookieJar();

  HomeRepositoryImpl._();
  static HomeRepository get instance => HomeRepositoryImpl._();

  @override
  Future<Response> getCookei() async {
    var response = await _ApiService.getSession();
     if (response.statusCode != 200) throw " data error";
    return response;
  }

  @override
  Future<LinkModel> gcSentLink({String? link}) {
    // TODO: implement gcSentLink
    throw UnimplementedError();
  }

  @override
  Future<LinkModel> keywordSearch({String? keyword, String? search}) async {
    var response = await _ApiService.keyworkSearch(keyword!, search!);
     if (response.statusCode != 200) throw " data error";
    return response.body!;
  }

  @override
  Future<LinkModel?> sentLink({String? link}) async{
     var response = await _ApiService.sentLink(link!);
      if (response.statusCode != 200) throw " data error";
    return response.body;
  }
}
