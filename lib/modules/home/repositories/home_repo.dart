

import 'package:chopper/chopper.dart';
import 'package:downloader4u/model/data/link_model.dart';

abstract class HomeRepository {
  HomeRepository._();
   Future<Response<dynamic>> getCookei();
   Future<LinkModel?>?  sentLink({String? link});
   Future<LinkModel?>?  gcSentLink({String? link});
   Future<LinkModel?>? keywordSearch({String? keyword,String? search});
}
