// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$APIService extends APIService {
  _$APIService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = APIService;

  @override
  Future<Response<dynamic>> getSession() {
    final $url = '/';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<LinkModel>> sentLink(String link) {
    final $url = '/';
    final $body = <String, dynamic>{'link': link};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LinkModel, LinkModel>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<LinkModel>> gcsentLink(String link) {
    final $url = '/';
    final $body = <String, dynamic>{'link': link};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LinkModel, LinkModel>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }

  @override
  Future<Response<LinkModel>> keyworkSearch(String link, String search) {
    final $url = '/';
    final $body = <String, dynamic>{'link': link, 'search': search};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<LinkModel, LinkModel>($request,
        requestConverter: FormUrlEncodedConverter.requestFactory);
  }
}
