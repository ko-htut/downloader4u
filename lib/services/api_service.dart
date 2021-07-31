import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:downloader4u/model/data/link_model.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class APIService extends ChopperService {
  static APIService create([ChopperClient? client]) => _$APIService(client);

  @Get(path: '')
  Future<Response> getSession();

  @Post(path: '')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response<LinkModel>> sentLink(@Field('link') String link);

  @Post(path: '')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response<LinkModel>> gcsentLink(@Field('link') String link);

  @Post(path: '')
  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  Future<Response<LinkModel>> keyworkSearch(
    @Field('link') String link,
    @Field('search') String search,
  );
}
